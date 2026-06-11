-- ----- fragment: minion_1enoch_50.sql (session250 1-enoch 50) -----
-- Source anchor: enoch/1-enoch ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en50 (view _session250_en50_lookup). Sort band base 51225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-50-change-for-the-elect-light-and-glory
  ('enoch', '1-enoch', 50, 1, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* Enoch''s light and glory that ''turn to the holy'' (50:1) is Malachi''s Sun of righteousness rising on those who fear His name.'),
  ('enoch', '1-enoch', 50, 1, 'canon', 'isaiah', 30, 18, 'free', E'Isaiah 30:18 — *And therefore will Yahuah (LORD) wait, that he may be gracious unto you, and therefore will he be exalted, that he may have mercy upon you: for Yahuah (LORD) is a Elohim (God) of judgment: blessed are all they that wait for him.* The ''change'' for the elect (50:1) is the gracious verdict of the Elohim of judgement who waited.'),
  ('enoch', '1-enoch', 50, 1, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ''light of days'' abiding on the holy (50:1) is the everlasting life Daniel sees for those who awake.'),
  ('enoch', '1-enoch', 50, 1, 'enoch', '1-enoch', 51, 2, 'extras', E'1 Enoch 51:2 — *And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* Enoch''s own next chapter names the Elect One under whom the change of 50:1 takes place.'),
  -- thread: 1-enoch-50-evil-treasured-up-and-the-call-to-repent
  ('enoch', '1-enoch', 50, 2, 'canon', 'romans', 2, 4, 'free', E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Paul names the same goodness that ''causes the others to witness that they may repent'' (50:2).'),
  ('enoch', '1-enoch', 50, 2, 'canon', 'romans', 2, 5, 'free', E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God).* Paul''s ''treasurest up... against the day of wrath'' is Enoch''s ''evil shall have been treasured up against the sinners'' (50:2).'),
  ('enoch', '1-enoch', 50, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* Peter explains why the others are made to witness and repent (50:2): the Creator is not willing that any should perish.'),
  ('enoch', '1-enoch', 50, 2, 'apocrypha', 'the-wisdom-of-solomon', 11, 23, 'extras', E'The Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* A parallel extra-canonical witness to the mercy that gives the sinners room to repent (50:2).'),
  -- thread: 1-enoch-50-saved-through-his-name
  ('enoch', '1-enoch', 50, 3, 'canon', 'joel', 2, 32, 'free', E'Joel 2:32 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* ''Through His name shall they be saved'' (50:3) is Joel''s deliverance for all who call on the name, in the remnant He calls.'),
  ('enoch', '1-enoch', 50, 3, 'canon', 'acts', 2, 21, 'free', E'Acts 2:21 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved.* Peter at Shavuot preaches Enoch''s same saving name (50:3).'),
  ('enoch', '1-enoch', 50, 3, 'canon', 'romans', 10, 13, 'free', E'Romans 10:13 — *For whosoever shall call upon the name of Yahuah (Lord) shall be saved.* Paul restates the doctrine of 50:3: salvation comes through His name, not through honour of one''s own.'),
  ('enoch', '1-enoch', 50, 3, 'canon', 'proverbs', 18, 10, 'free', E'Proverbs 18:10 — *The name of Yahuah (LORD) is a strong tower: the righteous runneth into it, and is safe.* The name through which the righteous are saved (50:3) is itself their refuge.'),
  ('enoch', '1-enoch', 50, 3, 'enoch', '1-enoch', 48, 7, 'extras', E'1 Enoch 48:7 — *And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness, And have hated all its works and ways in the name of Yahuah (God) of Spirits: For in his name they are saved, And according to his good pleasure hath it been in regard to their life.* Enoch''s own Parables ground the saving name of 50:3 in the named Elect One, the Son of Adam.'),
  -- thread: 1-enoch-50-discern-the-righteous-from-the-wicked
  ('enoch', '1-enoch', 50, 2, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The holy who are made victorious in His name (50:2) are those written in Malachi''s book of remembrance for thinking upon His name.'),
  ('enoch', '1-enoch', 50, 4, 'canon', 'malachi', 3, 18, 'free', E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The chapter''s sorting — glory to the holy, the unrepentant perishing (50:1, 50:4) — is Malachi''s discernment of the righteous from the wicked.'),
  ('enoch', '1-enoch', 50, 4, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The righteous judgement of 50:4 is John''s opened books and book of life.'),
  ('enoch', '1-enoch', 50, 1, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The glory and honour that turn to the holy (50:1) is the unblotted name confessed before the Father.'),
  ('enoch', '1-enoch', 50, 4, 'enoch', '1-enoch', 108, 3, 'extras', E'1 Enoch 108:3 — *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* Enoch''s own books show the inverse of 50:4''s verdict: the unrepentant blotted out, while the elect''s names stand.'),
  -- thread: 1-enoch-50-righteous-judgement-and-the-end-of-mercy
  ('enoch', '1-enoch', 50, 5, 'canon', 'malachi', 4, 1, 'free', E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The day when He will have no more mercy (50:5) is Malachi''s oven-day that burns up the proud.'),
  ('enoch', '1-enoch', 50, 4, 'canon', 'isaiah', 30, 15, 'free', E'Isaiah 30:15 — *For thus saith Adonai Yahuah (the Lord GOD), the Holy One of Yashar''el (Israel); In returning and rest shall ye be saved; in quietness and in confidence shall be your strength: and ye would not.* The unrepentant who perish (50:4) are those who ''would not'' return to the salvation that was offered.'),
  ('enoch', '1-enoch', 50, 4, 'canon', 'romans', 2, 5, 'free', E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God).* Paul''s ''righteous judgment of Elohim'' against the impenitent heart is Enoch''s righteous judgement under which the unrepentant perish (50:4).'),
  ('enoch', '1-enoch', 50, 4, 'enoch', '1-enoch', 51, 1, 'extras', E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise.* Enoch''s own next chapter sets the righteous judgement of 50:4 after the resurrection, when the Elect One arises to judge.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-50-change-for-the-elect-light-and-glory',
       E'The change for the holy and elect: light and glory turned upon them',
       E'Enoch opens the chapter with the turning of the age for Yahuah''s people: *And in those days a change shall take place for the holy and elect, And the light of days shall abide upon them, And glory and honour shall turn to the holy* (1 Enoch 50:1). This is not a self-selected class earning reward but the elect already named (ch48) now vindicated. Malachi binds the same dawn to the fear of His name: *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall* (Malachi 4:2). The change is the patient verdict of a Elohim of judgement: *And therefore will Yahuah (LORD) wait, that he may be gracious unto you, and therefore will he be exalted, that he may have mercy upon you: for Yahuah (LORD) is a Elohim (God) of judgment: blessed are all they that wait for him* (Isaiah 30:18). Daniel sees the resurrection-glory that ''the light of days'' anticipates: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). And Enoch''s own next chapter names the One under whom the change comes — *For in those days the Elect One shall arise, And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved* (1 Enoch 51:2) — the Formed Son ordered under the Head of Days, vindicating Yashar''el''s gathered remnant, never a church replacing the elect.',
       sv.verse_id, ev.verse_id, 'extras', 51225
  FROM _session250_en50_lookup sv, _session250_en50_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=50 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-50-evil-treasured-up-and-the-call-to-repent',
       E'Evil treasured up against the sinners, yet space given to repent',
       E'On the day of reckoning the stored-up wickedness is opened, yet even then mercy makes room: *On the day of affliction on which evil shall have been treasured up against the sinners. And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause the others to witness (this) That they may repent And forgo the works of their hands* (1 Enoch 50:2). Paul uses the very image of evil ''treasured up'' for the day of wrath, and the same goodness leading to repentance: *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4); *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God)* (Romans 2:5). Peter explains the delay as room for turning, not slackness: *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The Wisdom of Solomon, a parallel extra-canonical witness, says the same of the Creator''s restraint: *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend* (The Wisdom of Solomon 11:23). The repentance is real and Torah-shaped — to ''forgo the works of their hands'' is to turn from covenant-breaking, never a curse on the law itself.',
       sv.verse_id, ev.verse_id, 'extras', 51228
  FROM _session250_en50_lookup sv, _session250_en50_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=50 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-50-saved-through-his-name',
       E'No honour of their own — yet saved through His name',
       E'Enoch states the gospel of grace centuries before the apostles: *They shall have no honour through the name of Yahuah (God) of Spirits, Yet through His name shall they be saved, And Yahuah (God) of Spirits will have compassion on them, For His compassion is great* (1 Enoch 50:3). Salvation is ''through His name,'' not through merit. Joel pronounces the same: *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32) — note the remnant whom He calls, election preceding the call. The apostles carry it word for word: *And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21); *For whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). The name is itself the refuge: *The name of Yahuah (LORD) is a strong tower: the righteous runneth into it, and is safe* (Proverbs 18:10). And Enoch''s own Parables ground the saving name in the Named Son — the Elect One revealed to the righteous: *For in his name they are saved, And according to his good pleasure hath it been in regard to their life* (1 Enoch 48:7). The Son of Adam was named before the worlds (48:3); the name that saves in ch50 is the name of that Formed Son who came in flesh as Yahusha, ordered under the Head of Days yet bearing His own name to call upon.',
       sv.verse_id, ev.verse_id, 'extras', 51231
  FROM _session250_en50_lookup sv, _session250_en50_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=50 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-50-discern-the-righteous-from-the-wicked',
       E'The book of remembrance: discerning the righteous from the wicked',
       E'Across the chapter the elect and the sinners are sorted — glory turns to the holy (50:1), the righteous are victorious in His name (50:2), the unrepentant perish (50:4) — exactly the discernment Malachi promises around the book of remembrance: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16); *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). Revelation shows the same books at the judgement: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12), and the elect name kept secure: *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels* (Revelation 3:5). Enoch''s own books carry the inverse — the names of the unrepentant erased: *For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever* (1 Enoch 108:3). Election precedes confession: the holy are remembered before they speak, written before the worlds (48:3), names blotted but never added.',
       sv.verse_id, ev.verse_id, 'extras', 51234
  FROM _session250_en50_lookup sv, _session250_en50_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=50 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-50-righteous-judgement-and-the-end-of-mercy',
       E'His righteous judgement: the unrepentant perish before Him',
       E'The chapter closes on the limit of the offered mercy — repentance was extended (50:2), but for those who refuse it, the door shuts: *And He is righteous also in His judgement, And in the presence of His glory unrighteousness also shall not maintain itself: At His judgement the unrepentant shall perish before Him* (1 Enoch 50:4); *And from henceforth I will have no mercy on them, saith Yahuah (God) of Spirits* (1 Enoch 50:5). Malachi pictures the same burning day for the proud: *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch* (Malachi 4:1). Isaiah names the salvation refused in returning and rest — the very repentance the unrepentant forgo: *For thus saith Adonai Yahuah (the Lord GOD), the Holy One of Yashar''el (Israel); In returning and rest shall ye be saved; in quietness and in confidence shall be your strength: and ye would not* (Isaiah 30:15). Paul gathers the impenitent into that same day: *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God)* (Romans 2:5). And Enoch''s own resurrection scene sets this judgement after the dead are raised — the Elect One choosing the righteous: *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise* (1 Enoch 51:1). The judgement is righteous because it is the Father''s order upheld through the Formed Son; mercy was great and real, and ends only where repentance is finally refused.',
       sv.verse_id, ev.verse_id, 'extras', 51237
  FROM _session250_en50_lookup sv, _session250_en50_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=50 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-50-change-for-the-elect-light-and-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* Enoch''s light and glory that ''turn to the holy'' (50:1) is Malachi''s Sun of righteousness rising on those who fear His name.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-change-for-the-elect-light-and-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 30:18 — *And therefore will Yahuah (LORD) wait, that he may be gracious unto you, and therefore will he be exalted, that he may have mercy upon you: for Yahuah (LORD) is a Elohim (God) of judgment: blessed are all they that wait for him.* The ''change'' for the elect (50:1) is the gracious verdict of the Elohim of judgement who waited.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-change-for-the-elect-light-and-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The ''light of days'' abiding on the holy (50:1) is the everlasting life Daniel sees for those who awake.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-change-for-the-elect-light-and-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 51:2 — *And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* Enoch''s own next chapter names the Elect One under whom the change of 50:1 takes place.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-change-for-the-elect-light-and-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-50-evil-treasured-up-and-the-call-to-repent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 2:4 — *Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* Paul names the same goodness that ''causes the others to witness that they may repent'' (50:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-evil-treasured-up-and-the-call-to-repent'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God).* Paul''s ''treasurest up... against the day of wrath'' is Enoch''s ''evil shall have been treasured up against the sinners'' (50:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-evil-treasured-up-and-the-call-to-repent'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* Peter explains why the others are made to witness and repent (50:2): the Creator is not willing that any should perish.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-evil-treasured-up-and-the-call-to-repent'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Wisdom of Solomon 11:23 — *But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend.* A parallel extra-canonical witness to the mercy that gives the sinners room to repent (50:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-evil-treasured-up-and-the-call-to-repent'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-50-saved-through-his-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:32 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call.* ''Through His name shall they be saved'' (50:3) is Joel''s deliverance for all who call on the name, in the remnant He calls.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-saved-through-his-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:21 — *And it shall come to pass, that whosoever shall call on the name of Yahuah (Lord) shall be saved.* Peter at Shavuot preaches Enoch''s same saving name (50:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-saved-through-his-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 10:13 — *For whosoever shall call upon the name of Yahuah (Lord) shall be saved.* Paul restates the doctrine of 50:3: salvation comes through His name, not through honour of one''s own.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-saved-through-his-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 18:10 — *The name of Yahuah (LORD) is a strong tower: the righteous runneth into it, and is safe.* The name through which the righteous are saved (50:3) is itself their refuge.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-saved-through-his-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 48:7 — *And the wisdom of Yahuah (God) of Spirits hath revealed him to the holy and righteous; For he hath preserved the lot of the righteous, Because they have hated and despised this world of unrighteousness, And have hated all its works and ways in the name of Yahuah (God) of Spirits: For in his name they are saved, And according to his good pleasure hath it been in regard to their life.* Enoch''s own Parables ground the saving name of 50:3 in the named Elect One, the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-saved-through-his-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-50-discern-the-righteous-from-the-wicked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The holy who are made victorious in His name (50:2) are those written in Malachi''s book of remembrance for thinking upon His name.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-discern-the-righteous-from-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:18 — *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not.* The chapter''s sorting — glory to the holy, the unrepentant perishing (50:1, 50:4) — is Malachi''s discernment of the righteous from the wicked.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-discern-the-righteous-from-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The righteous judgement of 50:4 is John''s opened books and book of life.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-discern-the-righteous-from-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The glory and honour that turn to the holy (50:1) is the unblotted name confessed before the Father.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-discern-the-righteous-from-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 108:3 — *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* Enoch''s own books show the inverse of 50:4''s verdict: the unrepentant blotted out, while the elect''s names stand.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-discern-the-righteous-from-the-wicked'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-50-righteous-judgement-and-the-end-of-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:1 — *For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* The day when He will have no more mercy (50:5) is Malachi''s oven-day that burns up the proud.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-righteous-judgement-and-the-end-of-mercy'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 30:15 — *For thus saith Adonai Yahuah (the Lord GOD), the Holy One of Yashar''el (Israel); In returning and rest shall ye be saved; in quietness and in confidence shall be your strength: and ye would not.* The unrepentant who perish (50:4) are those who ''would not'' return to the salvation that was offered.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-righteous-judgement-and-the-end-of-mercy'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 2:5 — *But after thy hardness and impenitent heart treasurest up unto thyself wrath against the day of wrath and revelation of the righteous judgment of Elohim (God).* Paul''s ''righteous judgment of Elohim'' against the impenitent heart is Enoch''s righteous judgement under which the unrepentant perish (50:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-righteous-judgement-and-the-end-of-mercy'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. 5a. For in those days the Elect One shall arise.* Enoch''s own next chapter sets the righteous judgement of 50:4 after the resurrection, when the Elect One arises to judge.'
  FROM cross_reference_threads t, cross_references x, _session250_en50_lookup sv, _session250_en50_lookup tv
 WHERE t.slug='1-enoch-50-righteous-judgement-and-the-end-of-mercy'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

