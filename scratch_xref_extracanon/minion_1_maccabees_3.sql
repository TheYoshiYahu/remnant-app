-- ----- fragment: minion_1maccabees_03.sql (session253 1-maccabees 3) -----
-- Source anchor: apocrypha/1-maccabees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac3 (view _session253_1mac3_lookup). Sort band base 61550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-3-lion-of-judah-rises
  ('apocrypha', '1-maccabees', 3, 4, 'canon', 'genesis', 49, 9, 'free', E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Jacob''s blessing on Judah is the wellspring of the lion-imagery laid on Judas, the whelp of that tribe roaring against Israel''s oppressors.'),
  ('apocrypha', '1-maccabees', 3, 4, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion-whelp Judas points forward to the Lion of Judah Himself, who alone prevails to deliver His people utterly.'),
  -- thread: 1-maccabees-3-victory-not-in-the-host
  ('apocrypha', '1-maccabees', 3, 19, 'canon', '1-samuel', 14, 6, 'free', E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan''s confidence at the garrison is the exact creed Judas preaches to his small company at Bethhoron.'),
  ('apocrypha', '1-maccabees', 3, 19, 'canon', '2-chronicles', 14, 11, 'free', E'2 Chronicles 14:11 — *And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee, and in thy name we go against this multitude. O Yahuah (LORD), thou art our Elohim (God); let not man prevail against thee.* Asa facing a million is Judas facing Seron''s host: the help of Yahuah makes the multitude and the few all one.'),
  ('apocrypha', '1-maccabees', 3, 19, 'canon', 'psalms', 33, 16, 'free', E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The Psalter states as settled doctrine the truth Judas applies on the field — the host saves no one; deliverance is from heaven.'),
  ('apocrypha', '1-maccabees', 3, 19, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word to the rebuilder is the same word in the Maccabee''s mouth: strength comes not from the arm of flesh but from the Spirit of Yahuah.'),
  ('apocrypha', '1-maccabees', 3, 18, 'apocrypha', '2-maccabees', 8, 18, 'extras', E'2 Maccabees 8:18 — *For they, said he, trust in their weapons and boldness; but our confidence is in the Almighty who at a beck can cast down both them that come against us, and also all the world.* The sister-account preserves Judas confessing the very contrast he draws here — the enemy''s multitude against the Almighty who delivers with great host or small.'),
  -- thread: 1-maccabees-3-we-fight-for-our-lives-and-our-laws
  ('apocrypha', '1-maccabees', 3, 21, 'canon', 'deuteronomy', 32, 47, 'free', E'Deuteronomy 32:47 — *For it is not a vain thing for you; because it is your life: and through this thing ye shall prolong your days in the land, whither ye go over Jordan to possess it.* Moses called the law Israel''s very life, which is precisely why the Maccabees would die fighting for their laws rather than see them abolished.'),
  ('apocrypha', '1-maccabees', 3, 60, 'canon', 'matthew', 26, 39, 'free', E'Matthew 26:39 — *And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* Judas'' surrender of the battle''s outcome to heaven''s will foreshadows the Messiah''s own Gethsemane submission, the same heart that bows to the Father against the kingdom of man.'),
  -- thread: 1-maccabees-3-antiochus-roots-out-the-strength-of-israel
  ('apocrypha', '1-maccabees', 3, 35, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold Antiochus'' very decree to pollute the sanctuary and abolish the law that Judas now rises to resist.'),
  ('apocrypha', '1-maccabees', 3, 35, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reads Antiochus'' desolation as the type of the last abomination, the same kingdom-of-man system the Maccabees confronted made manifest again.'),
  ('apocrypha', '1-maccabees', 3, 29, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Antiochus'' war on the ancient laws is the same self-exalting man-of-sin pattern Paul names — the antichrist system, not merely one tyrant.'),
  -- thread: 1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh
  ('apocrypha', '1-maccabees', 3, 44, 'canon', '2-chronicles', 20, 3, 'free', E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* Jehoshaphat''s proclaimed fast before the great company is the very pattern the congregation keeps at Mizpeh before facing Antiochus'' host.'),
  ('apocrypha', '1-maccabees', 3, 53, 'canon', '2-chronicles', 20, 12, 'free', E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s plea of helplessness with eyes fixed on Yahuah is the same cry the assembly raises — except thou be our help, how shall we stand?'),
  ('apocrypha', '1-maccabees', 3, 47, 'canon', 'joel', 2, 15, 'free', E'Joel 2:15 — *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly:* Joel''s command for a sanctified fast and solemn assembly is fulfilled to the letter at Mizpeh, where they fast, mourn, and then sound the trumpets.'),
  ('apocrypha', '1-maccabees', 3, 45, 'apocrypha', '1-maccabees', 1, 39, 'extras', E'1 Maccabees 1:39 — *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach her honour into contempt.* The opening lament over the desolated sanctuary and silenced feasts is the grief now driving the congregation to fast and pray for the city laid void as a wilderness.'),
  -- thread: 1-maccabees-3-captains-of-thousands-and-the-war-exemptions
  ('apocrypha', '1-maccabees', 3, 55, 'canon', 'exodus', 18, 21, 'free', E'Exodus 18:21 — *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens:* Jethro''s counsel to Moses set the very ranks of thousands, hundreds, fifties, and tens that Judas now ordains over his army.'),
  ('apocrypha', '1-maccabees', 3, 56, 'canon', 'deuteronomy', 20, 5, 'free', E'Deuteronomy 20:5 — *And the officers shall speak unto the people, saying, What man is there that hath built a new house, and hath not dedicated it? let him go and return to his house, lest he die in the battle, and another man dedicate it.* The Torah''s release of the man with a new house is the first of the exemptions Judas keeps to the letter, sending such men home according to the law.'),
  ('apocrypha', '1-maccabees', 3, 56, 'canon', 'deuteronomy', 20, 8, 'free', E'Deuteronomy 20:8 — *And the officers shall speak further unto the people, and they shall say, What man is there that is fearful and fainthearted? let him go and return unto his house, lest his brethren''s heart faint as well as his heart.* The dismissal of the fearful in Judas'' muster comes straight from this war-statute, the Maccabee ordering his camp according to the law of Moses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-lion-of-judah-rises',
       E'Judas the lion-whelp rises in his father''s stead',
       E'Mattathias is gathered to his fathers and his son takes up the zeal: *Then his son Judas, called Maccabeus, rose up in his stead. And all his brothers helped him... and they fought with cheerfulness the battle of Yashar''el (Israel)* (1 Maccabees 3:1-2). Of him the chronicler writes, *In his acts he was like a lion, and like a lion''s whelp roaring for his prey* (1 Maccabees 3:4) — and that figure is no accident, for it is the very blessing Jacob laid on the tribe from which the Hasmoneans came: *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* (Genesis 49:9). The lion of Judah stirs against the kingdom of man, *destroying the ungodly... and turning away wrath from Yashar''el (Israel)* (1 Maccabees 3:8) — the same Lion who at the last *hath prevailed to open the book*: *Behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book* (Revelation 5:5). This is no new thing; the covenant seed is kept, and one whelp of Judah after another roars until the Lion Himself comes.',
       sv.verse_id, ev.verse_id, 'extras', 61550
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-victory-not-in-the-host',
       E'The victory standeth not in the multitude, but strength cometh from heaven',
       E'★ At Bethhoron the few faced the many, faint with fasting, and asked *How shall we be able, being so few, to fight against so great a multitude...?* (1 Maccabees 3:17). Judas answered with the marrow of the whole Scripture: *It is no hard matter for many to be shut up in the hands of a few; and with Yahuah (God) of heaven it is all one, to deliver with a great multitude, or a small company: For the victory of battle stands not in the multitude of an host; but strength comes from heaven* (1 Maccabees 3:18-19). It ain''t new. Jonathan said it at the garrison: *there is no restraint to Yahuah (LORD) to save by many or by few* (1 Samuel 14:6). Asa cried it before the million of Zerah: *it is nothing with thee to help, whether with many, or with them that have no power... let not man prevail against thee* (2 Chronicles 14:11). The Psalmist sang it: *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength* (Psalm 33:16). And the prophet sealed it as the word of Yahuah: *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6). The brother-book confesses the same against the kingdom of man: *they trust in their weapons and boldness; but our confidence is in the Almighty* (2 Maccabees 8:18). The arm of flesh fails; strength comes from heaven.',
       sv.verse_id, ev.verse_id, 'extras', 61553
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-we-fight-for-our-lives-and-our-laws',
       E'We fight for our lives and our laws — the covenant unto death',
       E'The Maccabean cause is not empire but covenant: *They come against us in much pride and iniquity to destroy us, and our wives and children, and to spoil us: But we fight for our lives and our laws* (1 Maccabees 3:20-21). This is Torah-faithfulness unto death — never law-as-curse, but the law loved as life against the kingdom of man that would abolish it. So Judas resolves the host before Emmaus: *it is better for us to die in battle, than to behold the calamities of our people and our sanctuary* (1 Maccabees 3:59), bowing all to heaven, *as the will of Yahuah (God) is in heaven, so let him do* (1 Maccabees 3:60) — the very prayer the Messiah would pray, *not as I will, but as thou wilt* (Matthew 26:39). They fought for the law because, as Moses charged, *it is not a vain thing for you; because it is your life* (Deuteronomy 32:47). To die rather than see the covenant trodden down is the witness of the seed kept.',
       sv.verse_id, ev.verse_id, 'extras', 61556
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-antiochus-roots-out-the-strength-of-israel',
       E'Antiochus decrees to root out Israel and abolish the law — the abomination',
       E'The kingdom of man shows its true face: Antiochus charges Lysias *that he should send an army against them, to destroy and root out the strength of Yashar''el (Israel), and the remnant of Jerusalem, and to take away their memorial from that place* (1 Maccabees 3:35), the same king who waged war *in taking away the laws which had been of old time* (1 Maccabees 3:29). This is the antichrist pattern Daniel saw long before Antiochus came: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate* (Daniel 11:31). The Messiah Himself reaches back through Antiochus to the end: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place...* (Matthew 24:15). It is the same system in every age — the man of sin who *opposeth and exalteth himself above all that is called Elohim* (2 Thessalonians 2:4). What the Maccabees fought is what the saints will yet overcome: the dismantling of the kingdom of man, not the people of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 61559
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=35
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh',
       E'Fasting in sackcloth at Mizpeh — the assembly that asks mercy before battle',
       E'★ Before they draw the sword they bow the knee: the congregation gathers *that they might pray, and ask mercy and compassion* (1 Maccabees 3:44), mourning that *Jerusalem lay void as a wilderness... and joy was taken from Jacob, and the pipe with the harp ceased* (1 Maccabees 3:45). At Mizpeh, the old place of prayer, *Then they fasted that day, and put on sackcloth, and cast ashes upon their heads, and rent their clothes* (1 Maccabees 3:47), crying *How shall we be able to stand against them, except you, O Yahuah (God), be our help?* (1 Maccabees 3:53). This is no new liturgy. Jehoshaphat did exactly so against the great company: *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3), pleading *we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee* (2 Chronicles 20:12). And the prophet Joel commanded the very assembly the Maccabees keep: *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15) — the trumpet they then sound (1 Maccabees 3:54). The sanctuary laid waste, the feasts turned to mourning, was already lamented in the first chapter: *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach* (1 Maccabees 1:39). The covenant people seek mercy first; the battle belongs to Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 61562
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=44
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-3-captains-of-thousands-and-the-war-exemptions',
       E'Captains over thousands and the Torah war-exemptions kept',
       E'Judas orders the host by the pattern Moses set in the wilderness: *Then Judas ordained captains over the people, even captains over thousands, and over hundreds, and over fifties, and over tens* (1 Maccabees 3:55) — the very ranks Jethro counselled and Moses appointed: *and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens* (Exodus 18:21). And his muster keeps the law''s own mercy, sending home *such as were building houses, or had betrothed wives, or were planting vineyards, or were fearful... every man to his own house, according to the law* (1 Maccabees 3:56). It ain''t new — this is Deuteronomy''s war-charge word for word: the officers release *what man is there that hath built a new house... that hath planted a vineyard... that hath betrothed a wife... that is fearful and fainthearted* (Deuteronomy 20:5-8). Even in his rising the Maccabee fights *according to the law*, the covenant kept down to the order of the camp.',
       sv.verse_id, ev.verse_id, 'extras', 61565
  FROM _session253_1mac3_lookup sv, _session253_1mac3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=3 AND ev.verse_number=56
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-3-lion-of-judah-rises
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:9 — *Yahudah (Judah) is a lion''s whelp: from the prey, my son, thou art gone up: he stooped down, he couched as a lion, and as an old lion; who shall rouse him up?* Jacob''s blessing on Judah is the wellspring of the lion-imagery laid on Judas, the whelp of that tribe roaring against Israel''s oppressors.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-lion-of-judah-rises'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The lion-whelp Judas points forward to the Lion of Judah Himself, who alone prevails to deliver His people utterly.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-lion-of-judah-rises'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-victory-not-in-the-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:6 — *And Jonathan said to the young man that bare his armour, Come, and let us go over unto the garrison of these uncircumcised: it may be that Yahuah (LORD) will work for us: for there is no restraint to Yahuah (LORD) to save by many or by few.* Jonathan''s confidence at the garrison is the exact creed Judas preaches to his small company at Bethhoron.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 14:11 — *And Asa cried unto Yahuah Elohav (the LORD his God), and said, Yahuah (LORD), it is nothing with thee to help, whether with many, or with them that have no power: help us, O Yahuah (LORD) our Elohim (God); for we rest on thee, and in thy name we go against this multitude. O Yahuah (LORD), thou art our Elohim (God); let not man prevail against thee.* Asa facing a million is Judas facing Seron''s host: the help of Yahuah makes the multitude and the few all one.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 33:16 — *There is no king saved by the multitude of an host: a mighty man is not delivered by much strength.* The Psalter states as settled doctrine the truth Judas applies on the field — the host saves no one; deliverance is from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The prophet''s word to the rebuilder is the same word in the Maccabee''s mouth: strength comes not from the arm of flesh but from the Spirit of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 8:18 — *For they, said he, trust in their weapons and boldness; but our confidence is in the Almighty who at a beck can cast down both them that come against us, and also all the world.* The sister-account preserves Judas confessing the very contrast he draws here — the enemy''s multitude against the Almighty who delivers with great host or small.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-victory-not-in-the-host'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=8 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-we-fight-for-our-lives-and-our-laws
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:47 — *For it is not a vain thing for you; because it is your life: and through this thing ye shall prolong your days in the land, whither ye go over Jordan to possess it.* Moses called the law Israel''s very life, which is precisely why the Maccabees would die fighting for their laws rather than see them abolished.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-we-fight-for-our-lives-and-our-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:39 — *And he went a little further, and fell on his face, and prayed, saying, O my Father, if it be possible, let this cup pass from me: nevertheless not as I will, but as thou wilt.* Judas'' surrender of the battle''s outcome to heaven''s will foreshadows the Messiah''s own Gethsemane submission, the same heart that bows to the Father against the kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-we-fight-for-our-lives-and-our-laws'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-antiochus-roots-out-the-strength-of-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold Antiochus'' very decree to pollute the sanctuary and abolish the law that Judas now rises to resist.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-antiochus-roots-out-the-strength-of-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah reads Antiochus'' desolation as the type of the last abomination, the same kingdom-of-man system the Maccabees confronted made manifest again.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-antiochus-roots-out-the-strength-of-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* Antiochus'' war on the ancient laws is the same self-exalting man-of-sin pattern Paul names — the antichrist system, not merely one tyrant.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-antiochus-roots-out-the-strength-of-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* Jehoshaphat''s proclaimed fast before the great company is the very pattern the congregation keeps at Mizpeh before facing Antiochus'' host.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s plea of helplessness with eyes fixed on Yahuah is the same cry the assembly raises — except thou be our help, how shall we stand?'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:15 — *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly:* Joel''s command for a sanctified fast and solemn assembly is fulfilled to the letter at Mizpeh, where they fast, mourn, and then sound the trumpets.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 1:39 — *Her sanctuary was laid waste like a wilderness, her feasts were turned into mourning, her sabbaths into reproach her honour into contempt.* The opening lament over the desolated sanctuary and silenced feasts is the grief now driving the congregation to fast and pray for the city laid void as a wilderness.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-fast-sackcloth-and-prayer-at-mizpeh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=45
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-3-captains-of-thousands-and-the-war-exemptions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 18:21 — *Moreover thou shalt provide out of all the people able men, such as fear Elohim (God), men of truth, hating covetousness; and place such over them, to be rulers of thousands, and rulers of hundreds, rulers of fifties, and rulers of tens:* Jethro''s counsel to Moses set the very ranks of thousands, hundreds, fifties, and tens that Judas now ordains over his army.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-captains-of-thousands-and-the-war-exemptions'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 20:5 — *And the officers shall speak unto the people, saying, What man is there that hath built a new house, and hath not dedicated it? let him go and return to his house, lest he die in the battle, and another man dedicate it.* The Torah''s release of the man with a new house is the first of the exemptions Judas keeps to the letter, sending such men home according to the law.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-captains-of-thousands-and-the-war-exemptions'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 20:8 — *And the officers shall speak further unto the people, and they shall say, What man is there that is fearful and fainthearted? let him go and return unto his house, lest his brethren''s heart faint as well as his heart.* The dismissal of the fearful in Judas'' muster comes straight from this war-statute, the Maccabee ordering his camp according to the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac3_lookup sv, _session253_1mac3_lookup tv
 WHERE t.slug='1-maccabees-3-captains-of-thousands-and-the-war-exemptions'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=3 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

