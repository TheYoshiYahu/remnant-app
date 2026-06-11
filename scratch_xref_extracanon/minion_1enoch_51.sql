-- ----- fragment: minion_1enoch_51.sql (session250 1-enoch 51) -----
-- Source anchor: enoch/1-enoch ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en51 (view _session250_en51_lookup). Sort band base 51250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-51-earth-gives-back-the-dead
  ('enoch', '1-enoch', 51, 1, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The dust giving up its sleepers is Enoch''s earth giving back what was entrusted to it (51:1).'),
  ('enoch', '1-enoch', 51, 1, 'canon', 'isaiah', 26, 19, 'free', E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* Isaiah''s ''earth shall cast out the dead'' is the same earth that gives back its entrusted dead in Enoch 51:1.'),
  ('enoch', '1-enoch', 51, 1, 'canon', 'revelation', 20, 13, 'free', E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* John''s threefold giving-back — sea, death, hell — matches Enoch''s earth, Sheol, and hell each surrendering what they hold (51:1).'),
  ('enoch', '1-enoch', 51, 1, 'canon', 'hosea', 13, 14, 'free', E'Hosea 13:14 — *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction: repentance shall be hid from mine eyes.* The grave is plundered and made to pay its debt, exactly as Enoch''s hell ''gives back that which it owes'' (51:1).'),
  -- thread: 1-enoch-51-all-in-the-graves-hear-his-voice
  ('enoch', '1-enoch', 51, 2, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The Elect One who ''shall arise'' and gather the righteous in Enoch 51:1–2 is the Son of Adam whose voice empties the graves.'),
  ('enoch', '1-enoch', 51, 2, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The twofold raising matches Enoch''s Elect One choosing the righteous and holy ''from among them'' (51:2).'),
  ('enoch', '1-enoch', 51, 2, 'canon', 'john', 5, 27, 'free', E'John 5:27 — *And hath given him authority to execute judgment also, because he is the Son of Adam.* The very title Enoch names in 46:3 is given resurrection-and-judgment authority — the Elect One arising to save in 51:1–2.'),
  ('enoch', '1-enoch', 51, 2, 'canon', 'ezekiel', 37, 12, 'free', E'Ezekiel 37:12 — *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* The opened graves of the whole house of Israel are the people Enoch''s Elect One chooses to be saved (51:2).'),
  ('enoch', '1-enoch', 51, 2, 'canon', 'ezekiel', 37, 14, 'free', E'Ezekiel 37:14 — *And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* The raised people are placed in their own land — the regathered tribes, not a church replacing them, answering Enoch''s day ''that they should be saved'' (51:2).'),
  -- thread: 1-enoch-51-elect-one-on-the-throne-of-glory
  ('enoch', '1-enoch', 51, 3, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees *one like* the Son of Adam under the kaph-comparative; Enoch names that same One seated on the Father''s throne (51:3).'),
  ('enoch', '1-enoch', 51, 3, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Head of Days giving and glorifying the Son in Enoch 51:3 is Daniel''s ''there was given him'' an everlasting kingdom.'),
  ('enoch', '1-enoch', 51, 3, 'canon', 'matthew', 25, 31, 'free', E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha''s own throne of glory is the throne the Father seats the Elect One upon in Enoch 51:3.'),
  ('enoch', '1-enoch', 51, 3, 'canon', 'isaiah', 11, 2, 'free', E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* The wisdom and counsel pouring from the Elect One''s mouth in Enoch 51:3 is the Spirit of wisdom and counsel resting on the Branch.'),
  ('enoch', '1-enoch', 51, 3, 'enoch', '1-enoch', 61, 8, 'extras', E'1 Enoch 61:8 — *And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* Enoch''s own parallel: the Father places the Elect One on the throne of glory to judge, the same enthronement as 51:3.'),
  -- thread: 1-enoch-51-named-before-creation-the-elect-one
  ('enoch', '1-enoch', 51, 1, 'enoch', '1-enoch', 46, 3, 'extras', E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The Elect One who arises to raise the dead in 51:1 is the named, chosen Son of Adam of the foundational vision.'),
  ('enoch', '1-enoch', 51, 2, 'enoch', '1-enoch', 48, 2, 'extras', E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Elect One who chooses the righteous in 51:2 is the One whose name was named before the Father — election before confession.'),
  ('enoch', '1-enoch', 51, 2, 'enoch', '1-enoch', 48, 3, 'extras', E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* Named before sun, signs, and stars — the chosen-before-creation One whose ''day has drawn nigh'' to save in 51:2.'),
  ('enoch', '1-enoch', 51, 3, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Son named before creation in Enoch 48 is the Word who was with the Father in the beginning — the Formed One enthroned in 51:3.'),
  ('enoch', '1-enoch', 51, 3, 'canon', 'revelation', 13, 8, 'free', E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The Lamb chosen and hidden before creation (1 Enoch 48:6) is the One the Father has glorified and seated in 51:3.'),
  -- thread: 1-enoch-51-books-of-the-living-prayer-of-the-righteous
  ('enoch', '1-enoch', 51, 2, 'enoch', '1-enoch', 47, 3, 'extras', E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* The Elect One''s choosing of the righteous in 51:2 is reckoned from the books of the living opened before the Head of Days.'),
  ('enoch', '1-enoch', 51, 2, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The same heavenly court — host standing, judgment set, books opened — from which the righteous are chosen in Enoch 51:2.'),
  ('enoch', '1-enoch', 51, 2, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s book of life is Enoch''s books of the living, from which the Elect One chooses the righteous in 51:2.'),
  -- thread: 1-enoch-51-the-earth-shall-rejoice-the-elect-dwell
  ('enoch', '1-enoch', 51, 4, 'canon', 'psalms', 2, 6, 'free', E'Psalm 2:6 — *Yet have I set my king upon my holy hill of Zion.* The King the Father sets on Zion reigns over the rejoicing earth where Enoch''s elect walk (51:4).'),
  ('enoch', '1-enoch', 51, 4, 'canon', 'psalms', 2, 7, 'free', E'Psalm 2:7 — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The begotten Son ordered under the Father is the Elect One enthroned, whose reign brings the earth''s rejoicing in 51:4.'),
  ('enoch', '1-enoch', 51, 4, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The righteous reign that lets the meek inherit answers Enoch''s righteous dwelling and elect walking the rejoicing earth (51:4).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-51-earth-gives-back-the-dead',
       E'The earth, Sheol, and hell give back the dead',
       E'Enoch sees the resurrection as a returning of what was held in trust: *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes.* (1 Enoch 51:1). This is no new doctrine — it is the prophets'' own hope. Daniel names it: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Isaiah sings it: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19) — the very ''earth casting out'' Enoch describes. And John''s Revelation makes the threefold giving-back exact: *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* (Revelation 20:13). The grave holds nothing of its own; it owes, and it must pay.',
       sv.verse_id, ev.verse_id, 'extras', 51250
  FROM _session250_en51_lookup sv, _session250_en51_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=51 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-51-all-in-the-graves-hear-his-voice',
       E'All in the graves shall hear his voice and come forth',
       E'Enoch joins the resurrection to the Elect One Himself: *For in those days the Elect One shall arise, And he shall choose the righteous and holy from among them: For the day has drawn nigh that they should be saved.* (1 Enoch 51:1–2). The Son of Adam whom Enoch *names* (1 Enoch 46:3) is the one Yahusha says will raise and judge the dead by His own voice: *And hath given him authority to execute judgment also, because he is the Son of Adam.* (John 5:27) — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* (John 5:28) *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* (John 5:29). Enoch''s ''choosing of the righteous from among them'' is exactly this twofold raising — life for some, damnation for others. And Ezekiel had already promised it to a people, not a self-selected class: *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* (Ezekiel 37:12) — the opened graves of the whole house of Israel regathered.',
       sv.verse_id, ev.verse_id, 'extras', 51253
  FROM _session250_en51_lookup sv, _session250_en51_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=51 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-51-elect-one-on-the-throne-of-glory',
       E'The Elect One on the throne, pouring forth wisdom',
       E'Enoch sees the Father seat the Son: *And the Elect One shall in those days sit on My throne, And his mouth shall pour forth all the secrets of wisdom and counsel: For Yahuah (God) of Spirits hath given (them) to him and hath glorified him.* (1 Enoch 51:3). This is the Son of Adam *named* — not a kaph-comparison but a title. Daniel, by contrast, sees him under the comparative: *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* (Daniel 7:13) — *one like* the Son of Adam, for the Formed cloud-rider had taken on flesh and so resembles mortal-man; Enoch names that same One. To him is given the throne and dominion: *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). Yahusha confirms it is His own throne of glory: *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* (Matthew 25:31). The wisdom poured from His mouth is the Spirit Isaiah named: *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* (Isaiah 11:2). The Head of Days (the formless Father) glorifies and gives; the Elect One (the Formed Son) receives, sits, and reigns — ordered under the Father, worshipped with Him yet distinct from Him.',
       sv.verse_id, ev.verse_id, 'extras', 51256
  FROM _session250_en51_lookup sv, _session250_en51_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=51 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-51-named-before-creation-the-elect-one',
       E'The named Son of Adam, chosen before the worlds',
       E'The throne of 51:3 belongs to no created angel and no mere man but to the One Enoch saw beside the Head of Days from the first: *And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man... This is the Son of Adam who hath righteousness, with whom dwelleth righteousness... because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* (1 Enoch 46:1, 46:3). Election precedes confession — this One was named before the worlds were: *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* (1 Enoch 48:2) — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* (1 Enoch 48:3). The Gospel opens the same way: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1), and the Lamb is *slain from the foundation of the world* (Revelation 13:8). The Father decrees and begets; the Son is chosen and hidden before creation, then revealed in flesh as Yahusha: *And for this reason hath he been chosen and hidden before Him, Before the creation of the world and for evermore.* (1 Enoch 48:6).',
       sv.verse_id, ev.verse_id, 'extras', 51259
  FROM _session250_en51_lookup sv, _session250_en51_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=51 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-51-books-of-the-living-prayer-of-the-righteous',
       E'The books of the living and the chosen righteous',
       E'The ''choosing of the righteous and holy from among them'' (51:2) is not arbitrary — it is reckoned from the books. Enoch''s own parallel shows the Head of Days enthroned over open books: *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3), and the hearts of the holy filled with joy *Because the number of the righteous had been offered, And the prayer of the righteous had been heard, And the blood of the righteous been required before Yahuah (God) of Spirits.* (1 Enoch 47:4). Daniel saw the same court: *the judgment was set, and the books were opened.* (Daniel 7:10). John saw it consummated: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12). The righteous Enoch''s Elect One chooses are those already written — election precedes the verdict, and the earth''s rejoicing in 51:4 is their vindication.',
       sv.verse_id, ev.verse_id, 'extras', 51262
  FROM _session250_en51_lookup sv, _session250_en51_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=51 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-51-the-earth-shall-rejoice-the-elect-dwell',
       E'The mountains leap and the elect walk the rejoicing earth',
       E'The resurrection ends not in dread but in creation''s gladness: *And in those days shall the mountains leap like rams, And the hills also shall skip like lambs satisfied with milk, And the faces of [all] the angels in heaven shall be lighted up with joy. And the earth shall rejoice, And the righteous shall dwell upon it, And the elect shall walk thereon.* (1 Enoch 51:4). The psalmist had set the King who reigns over this joy: *Yet have I set my king upon my holy hill of Zion.* (Psalm 2:6) — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* (Psalm 2:7), the begotten Son enthroned, the Formed under the Father. Isaiah names the reign that makes the meek inherit the rejoicing earth: *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). And the inheriting people are not a self-selected class but the elect who walk it — the regathered righteous of a redeemed land, the dew-raised dead of *Awake and sing, ye that dwell in dust... and the earth shall cast out the dead.* (Isaiah 26:19).',
       sv.verse_id, ev.verse_id, 'extras', 51265
  FROM _session250_en51_lookup sv, _session250_en51_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=51 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-51-earth-gives-back-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The dust giving up its sleepers is Enoch''s earth giving back what was entrusted to it (51:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-earth-gives-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* Isaiah''s ''earth shall cast out the dead'' is the same earth that gives back its entrusted dead in Enoch 51:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-earth-gives-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* John''s threefold giving-back — sea, death, hell — matches Enoch''s earth, Sheol, and hell each surrendering what they hold (51:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-earth-gives-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hosea 13:14 — *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction: repentance shall be hid from mine eyes.* The grave is plundered and made to pay its debt, exactly as Enoch''s hell ''gives back that which it owes'' (51:1).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-earth-gives-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-51-all-in-the-graves-hear-his-voice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice,* The Elect One who ''shall arise'' and gather the righteous in Enoch 51:1–2 is the Son of Adam whose voice empties the graves.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-all-in-the-graves-hear-his-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The twofold raising matches Enoch''s Elect One choosing the righteous and holy ''from among them'' (51:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-all-in-the-graves-hear-his-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:27 — *And hath given him authority to execute judgment also, because he is the Son of Adam.* The very title Enoch names in 46:3 is given resurrection-and-judgment authority — the Elect One arising to save in 51:1–2.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-all-in-the-graves-hear-his-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:12 — *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* The opened graves of the whole house of Israel are the people Enoch''s Elect One chooses to be saved (51:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-all-in-the-graves-hear-his-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 37:14 — *And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* The raised people are placed in their own land — the regathered tribes, not a church replacing them, answering Enoch''s day ''that they should be saved'' (51:2).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-all-in-the-graves-hear-his-voice'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-51-elect-one-on-the-throne-of-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees *one like* the Son of Adam under the kaph-comparative; Enoch names that same One seated on the Father''s throne (51:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Head of Days giving and glorifying the Son in Enoch 51:3 is Daniel''s ''there was given him'' an everlasting kingdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 25:31 — *When the Son of Adam shall come in his glory, and all the holy angels with him, then shall he sit upon the throne of his glory:* Yahusha''s own throne of glory is the throne the Father seats the Elect One upon in Enoch 51:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=25 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:2 — *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of Yahuah (LORD);* The wisdom and counsel pouring from the Elect One''s mouth in Enoch 51:3 is the Spirit of wisdom and counsel resting on the Branch.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 61:8 — *And the Head of Days placed the Elect One on the throne of His glory; And he shall judge all the works of the holy in heaven above, And weigh their deeds in the balance.* Enoch''s own parallel: the Father places the Elect One on the throne of glory to judge, the same enthronement as 51:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-elect-one-on-the-throne-of-glory'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=61 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-51-named-before-creation-the-elect-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The Elect One who arises to raise the dead in 51:1 is the named, chosen Son of Adam of the foundational vision.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-named-before-creation-the-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Elect One who chooses the righteous in 51:2 is the One whose name was named before the Father — election before confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-named-before-creation-the-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* Named before sun, signs, and stars — the chosen-before-creation One whose ''day has drawn nigh'' to save in 51:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-named-before-creation-the-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Son named before creation in Enoch 48 is the Word who was with the Father in the beginning — the Formed One enthroned in 51:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-named-before-creation-the-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 13:8 — *And all that dwell upon the earth shall worship him, whose names are not written in the book of life of the Lamb slain from the foundation of the world.* The Lamb chosen and hidden before creation (1 Enoch 48:6) is the One the Father has glorified and seated in 51:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-named-before-creation-the-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-51-books-of-the-living-prayer-of-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 47:3 — *In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* The Elect One''s choosing of the righteous in 51:2 is reckoned from the books of the living opened before the Head of Days.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-books-of-the-living-prayer-of-the-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The same heavenly court — host standing, judgment set, books opened — from which the righteous are chosen in Enoch 51:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-books-of-the-living-prayer-of-the-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s book of life is Enoch''s books of the living, from which the Elect One chooses the righteous in 51:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-books-of-the-living-prayer-of-the-righteous'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-51-the-earth-shall-rejoice-the-elect-dwell
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:6 — *Yet have I set my king upon my holy hill of Zion.* The King the Father sets on Zion reigns over the rejoicing earth where Enoch''s elect walk (51:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-the-earth-shall-rejoice-the-elect-dwell'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 2:7 — *I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The begotten Son ordered under the Father is the Elect One enthroned, whose reign brings the earth''s rejoicing in 51:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-the-earth-shall-rejoice-the-elect-dwell'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* The righteous reign that lets the meek inherit answers Enoch''s righteous dwelling and elect walking the rejoicing earth (51:4).'
  FROM cross_reference_threads t, cross_references x, _session250_en51_lookup sv, _session250_en51_lookup tv
 WHERE t.slug='1-enoch-51-the-earth-shall-rejoice-the-elect-dwell'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

