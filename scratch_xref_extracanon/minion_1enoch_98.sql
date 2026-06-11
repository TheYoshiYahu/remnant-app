-- ----- fragment: minion_1enoch_98.sql (session250 1-enoch 98) -----
-- Source anchor: enoch/1-enoch ch98. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en98 (view _session250_en98_lookup). Sort band base 52425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en98_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-98-woe-to-the-rich-poured-out-like-water
  ('enoch', '1-enoch', 98, 2, 'canon', 'james', 5, 1, 'free', E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James opens the same woe Enoch swears, calling the adorned rich to mourn the destruction already coming on their splendour.'),
  ('enoch', '1-enoch', 98, 3, 'canon', 'james', 5, 3, 'free', E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The silver, gold and splendour that perish with their owners in Enoch 98:3 become the very witness that devours them.'),
  ('enoch', '1-enoch', 98, 3, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s parable of the rich fool echoes Enoch''s verdict that the wealthy perish together with their possessions.'),
  ('enoch', '1-enoch', 98, 2, 'enoch', '1-enoch', 94, 7, 'extras', E'1 Enoch 94:7 — *Woe to you who acquire gold and silver in unrighteousness And say: ''We have become rich with riches and have possessions; And we have acquired everything that we have desired.* Enoch''s earlier woe names the same gold-and-silver pride that 98:2 dresses in royal purple.'),
  ('enoch', '1-enoch', 98, 3, 'apocrypha', 'ecclesiasticus', 11, 19, 'extras', E'Ecclesiasticus 11:19 — *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* Ben Sira''s self-satisfied hoarder dies just as Enoch''s splendid ones perish with all their glory.'),
  -- thread: 1-enoch-98-man-made-the-sin-himself
  ('enoch', '1-enoch', 98, 4, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Enoch''s oath that sin was not sent but self-created restates Moses'' two ways: the curse falls only on those who choose death over the offered life.'),
  ('enoch', '1-enoch', 98, 4, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* As Moses calls heaven and earth to witness the choice, Enoch swears that the great curse is freely incurred by those who commit the sin they themselves made.'),
  ('enoch', '1-enoch', 98, 4, 'canon', 'hosea', 8, 4, 'free', E'Hosea 8:4 — *They have set up kings, but not by me: they have made princes, and I knew it not: of their silver and their gold have they made them idols, that they may be cut off.* Hosea shows the same dynamic Enoch names: the people fashion with their own hands the thing that brings them under the curse.'),
  -- thread: 1-enoch-98-every-sin-recorded-in-heaven
  ('enoch', '1-enoch', 98, 7, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The same heaven that records every sin daily keeps a book of remembrance for the righteous — election written, never improvised.'),
  ('enoch', '1-enoch', 98, 8, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The oppression Enoch says is written down daily reaches heaven as the cry of the defrauded reapers.'),
  ('enoch', '1-enoch', 98, 7, 'enoch', '1-enoch', 104, 9, 'extras', E'1 Enoch 104:9 — *And I saw the books of the living, And the books of the unrighteous were opened, And the names of the sinners were found therein.* Enoch later sees the very ledgers that 98:7 says record every sin in the presence of the Most High.'),
  -- thread: 1-enoch-98-woe-to-those-who-eat-blood
  ('enoch', '1-enoch', 98, 11, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* Enoch''s woe on those who eat blood invokes the oldest covenant boundary, given to Noah for all flesh.'),
  ('enoch', '1-enoch', 98, 11, 'canon', 'leviticus', 17, 10, 'free', E'Leviticus 17:10 — *And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* Torah makes blood-eating a cutting-off sin, so Enoch''s blood-eaters rightly have no peace.'),
  ('enoch', '1-enoch', 98, 11, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The life that is in the blood, reserved for atonement, is what the obstinate consume — profaning the very thing Torah set apart.'),
  -- thread: 1-enoch-98-woe-to-the-writers-of-lying-words
  ('enoch', '1-enoch', 98, 15, 'canon', 'jeremiah', 8, 8, 'free', E'Jeremiah 8:8 — *How do ye say, We are wise, and the law of Yahuah (LORD) is with us? Lo, certainly in vain made he it; the pen of the scribes is in vain.* The lying pen of the scribes is exactly Enoch''s woe on those who write down godless words to make men act wickedly.'),
  ('enoch', '1-enoch', 98, 9, 'canon', 'isaiah', 5, 20, 'free', E'Isaiah 5:20 — *Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness; that put bitter for sweet, and sweet for bitter!* Isaiah''s woe on moral inversion underlies the folly Enoch says will slay the fools who transgress against the wise.'),
  ('enoch', '1-enoch', 98, 9, 'canon', 'isaiah', 5, 21, 'free', E'Isaiah 5:21 — *Woe unto them that are wise in their own eyes, and prudent in their own sight!* The self-wise fool of Isaiah''s woe is Enoch''s fool who perishes through his own folly and transgresses against the wise.'),
  ('enoch', '1-enoch', 98, 15, 'canon', 'isaiah', 10, 1, 'free', E'Isaiah 10:1 — *Woe unto them that decree unrighteous decrees, and that write grievousness which they have prescribed.* Isaiah''s woe on those who write injustice into law matches Enoch''s woe on those who write down lying and godless words.'),
  ('enoch', '1-enoch', 98, 15, 'enoch', '1-enoch', 99, 2, 'extras', E'1 Enoch 99:2 — *Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not [into sinners]: They shall be trodden under foot upon the earth.* Enoch''s very next woe names the same crime — perverting the eternal law in writing — confirming that Torah stands and its falsifiers fall.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en98_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en98_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-98-woe-to-the-rich-poured-out-like-water',
       E'The luxury that perishes — woe to the adorned and the rich',
       E'Enoch opens the woe by swearing to wise and foolish alike and describing the doomed splendour of the oppressor: *For ye men shall put on more adornments than a woman, And coloured garments more than a virgin: In royalty and in grandeur and in power, And in silver and in gold and in purple, And in splendour and in food they shall be poured out as water* (1 Enoch 98:2), whose end is that *they shall perish thereby together with their possessions* (1 Enoch 98:3). This is not a new complaint — it is the prophets'' and James'' woe on systems of injustice. James pronounces it on the hoarders: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1), for *your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days* (James 5:3). Yahusha tells it as a parable against the man whose barns are full: *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). Enoch''s own next woes name the same crowd — *Woe to you who acquire gold and silver in unrighteousness And say: ''We have become rich with riches and have possessions''* (1 Enoch 94:7) — and Ben Sira mocks the same false rest: *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Ecclesiasticus 11:19). The judgement falls on the structure of plunder, not on flesh as such.',
       sv.verse_id, ev.verse_id, 'extras', 52425
  FROM _session250_en98_lookup sv, _session250_en98_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=98 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-98-man-made-the-sin-himself',
       E'Sin was not sent — man made it himself',
       E'Against any plea that wickedness is fate, Enoch swears the opposite: *as a mountain has not become a slave, And a hill does not become the handmaid of a woman, Even so sin has not been sent upon the earth, But man of himself has created it, And under a great curse shall they fall who commit it* (1 Enoch 98:4). The curse is not Torah but the self-made fruit of breaking it — exactly the two-ways covenant Moses set before the people: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), with the charge, *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The choice is real; the death is chosen, not decreed. The prophets say it of Israel''s idols too: *They have set up kings, but not by me... of their silver and their gold have they made them idols, that they may be cut off* (Hosea 8:4) — the people fashion the very thing that destroys them. Torah stands as the way of life throughout; man, not the law, manufactures his own ruin.',
       sv.verse_id, ev.verse_id, 'extras', 52428
  FROM _session250_en98_lookup sv, _session250_en98_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=98 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-98-every-sin-recorded-in-heaven',
       E'All your deeds are written down in heaven',
       E'Enoch strips away the sinner''s secrecy: *all your evil deeds are revealed in the heavens, And that none of your deeds of oppression are covered and hidden* (1 Enoch 98:6); let none say *that ye do not know and that ye do not see That every sin is every day recorded in heaven in the presence of the Most High* (1 Enoch 98:7), for *all your oppression wherewith ye oppress is written down every day Till the day of your judgement* (1 Enoch 98:8). This heavenly ledger is the canon''s own book of remembrance: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16) — the righteous are recorded for life, the oppressor for judgement. Enoch''s later vision opens those very ledgers: *I saw the books of the living, And the books of the unrighteous were opened, And the names of the sinners were found therein* (1 Enoch 104:9). The oppressors James names think their fraud is hidden, yet *the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth* (James 5:4) — nothing of the oppression of the poor escapes the heavenly record.',
       sv.verse_id, ev.verse_id, 'extras', 52431
  FROM _session250_en98_lookup sv, _session250_en98_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=98 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-98-woe-to-those-who-eat-blood',
       E'Woe to the obstinate who eat blood',
       E'The woe turns on those who profane the table of the oppressed: *Woe to you, ye obstinate of heart, who work wickedness and eat blood: Whence have ye good things to eat and to drink and to be filled? From all the good things which Yahuah (God) the Most High has placed in abundance on the earth; Therefore ye shall have no peace* (1 Enoch 98:11). Eating blood is no minor matter; it is the covenant boundary set from Noah onward: *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4), and Torah makes it a cutting-off sin: *whatsoever man there be of the house of Yashar''el (Israel)... that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people* (Leviticus 17:10), *for the life of the flesh is in the blood* (Leviticus 17:11). Torah stands; the oppressor who devours the Creator''s abundance while trampling the poor breaks the law of life itself, and so has no peace.',
       sv.verse_id, ev.verse_id, 'extras', 52434
  FROM _session250_en98_lookup sv, _session250_en98_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=98 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-98-woe-to-the-writers-of-lying-words',
       E'Woe to those who write down lying and godless words',
       E'The chapter''s sharpest woe falls on the corrupters of the text itself: *Woe to you who write down lying and godless words; For they write down their lies that men may hear them and act godlessly towards their neighbour. Therefore they shall have no peace but die a sudden death* (1 Enoch 98:15-16), set beside *Woe to you who set at nought the words of the righteous; For ye shall have no hope of life* (1 Enoch 98:14). The prophets already aimed this at the scribes who falsify what is written: *How do ye say, We are wise, and the law of Yahuah (LORD) is with us? Lo, certainly in vain made he it; the pen of the scribes is in vain* (Jeremiah 8:8) — the lying pen perverts Torah. Isaiah''s woe binds folly to inversion: *Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness* (Isaiah 5:20), *Woe unto them that are wise in their own eyes, and prudent in their own sight!* (Isaiah 5:21) — which is exactly Enoch''s *ye fools... ye transgress against the wise* (1 Enoch 98:9). And Isaiah''s woe on those who legislate injustice in writing fits the godless scribe precisely: *Woe unto them that decree unrighteous decrees, and that write grievousness which they have prescribed* (Isaiah 10:1). Enoch himself names the crime again in the next chapter: *Woe to them who pervert the words of uprightness, And transgress the eternal law* (1 Enoch 99:2) — the eternal law (Torah) stands, and those who falsify it die a sudden death.',
       sv.verse_id, ev.verse_id, 'extras', 52437
  FROM _session250_en98_lookup sv, _session250_en98_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=14
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=98 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-98-woe-to-the-rich-poured-out-like-water
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James opens the same woe Enoch swears, calling the adorned rich to mourn the destruction already coming on their splendour.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-rich-poured-out-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The silver, gold and splendour that perish with their owners in Enoch 98:3 become the very witness that devours them.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-rich-poured-out-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* Yahusha''s parable of the rich fool echoes Enoch''s verdict that the wealthy perish together with their possessions.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-rich-poured-out-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 94:7 — *Woe to you who acquire gold and silver in unrighteousness And say: ''We have become rich with riches and have possessions; And we have acquired everything that we have desired.* Enoch''s earlier woe names the same gold-and-silver pride that 98:2 dresses in royal purple.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-rich-poured-out-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=94 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 11:19 — *Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die.* Ben Sira''s self-satisfied hoarder dies just as Enoch''s splendid ones perish with all their glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-rich-poured-out-like-water'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-98-man-made-the-sin-himself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Enoch''s oath that sin was not sent but self-created restates Moses'' two ways: the curse falls only on those who choose death over the offered life.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-man-made-the-sin-himself'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* As Moses calls heaven and earth to witness the choice, Enoch swears that the great curse is freely incurred by those who commit the sin they themselves made.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-man-made-the-sin-himself'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 8:4 — *They have set up kings, but not by me: they have made princes, and I knew it not: of their silver and their gold have they made them idols, that they may be cut off.* Hosea shows the same dynamic Enoch names: the people fashion with their own hands the thing that brings them under the curse.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-man-made-the-sin-himself'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-98-every-sin-recorded-in-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The same heaven that records every sin daily keeps a book of remembrance for the righteous — election written, never improvised.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-every-sin-recorded-in-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The oppression Enoch says is written down daily reaches heaven as the cry of the defrauded reapers.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-every-sin-recorded-in-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 104:9 — *And I saw the books of the living, And the books of the unrighteous were opened, And the names of the sinners were found therein.* Enoch later sees the very ledgers that 98:7 says record every sin in the presence of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-every-sin-recorded-in-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=104 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-98-woe-to-those-who-eat-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* Enoch''s woe on those who eat blood invokes the oldest covenant boundary, given to Noah for all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-those-who-eat-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:10 — *And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* Torah makes blood-eating a cutting-off sin, so Enoch''s blood-eaters rightly have no peace.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-those-who-eat-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* The life that is in the blood, reserved for atonement, is what the obstinate consume — profaning the very thing Torah set apart.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-those-who-eat-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-98-woe-to-the-writers-of-lying-words
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 8:8 — *How do ye say, We are wise, and the law of Yahuah (LORD) is with us? Lo, certainly in vain made he it; the pen of the scribes is in vain.* The lying pen of the scribes is exactly Enoch''s woe on those who write down godless words to make men act wickedly.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-writers-of-lying-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:20 — *Woe unto them that call evil good, and good evil; that put darkness for light, and light for darkness; that put bitter for sweet, and sweet for bitter!* Isaiah''s woe on moral inversion underlies the folly Enoch says will slay the fools who transgress against the wise.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-writers-of-lying-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 5:21 — *Woe unto them that are wise in their own eyes, and prudent in their own sight!* The self-wise fool of Isaiah''s woe is Enoch''s fool who perishes through his own folly and transgresses against the wise.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-writers-of-lying-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 10:1 — *Woe unto them that decree unrighteous decrees, and that write grievousness which they have prescribed.* Isaiah''s woe on those who write injustice into law matches Enoch''s woe on those who write down lying and godless words.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-writers-of-lying-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 99:2 — *Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not [into sinners]: They shall be trodden under foot upon the earth.* Enoch''s very next woe names the same crime — perverting the eternal law in writing — confirming that Torah stands and its falsifiers fall.'
  FROM cross_reference_threads t, cross_references x, _session250_en98_lookup sv, _session250_en98_lookup tv
 WHERE t.slug='1-enoch-98-woe-to-the-writers-of-lying-words'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=98 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

