-- =====================================================================
-- Session 225 — Revelation 11 TWO-WITNESSES two-house frame revision (S224 follow-up)
-- =====================================================================
-- Yoshi's settled reading, applied to the live Revelation-11 apparatus built in
-- session224. The TWO WITNESSES (the two olive trees / two candlesticks of Rev
-- 11:3-4) are NOT two individual end-times prophets (Moses + Elijah returned);
-- they are the HOUSE OF YAHUDAH (Judah) and the HOUSE OF YASHAR'EL (Israel) —
-- the two sticks of Ezekiel 37:16-22 joined into one, the two olive trees of
-- Zechariah 4, the divided kingdom regathered. The prophetic signs (fire,
-- shut-heaven, water-to-blood) are the witness of the Law and the Prophets borne
-- by the two houses, not the personal identity of two returned men. And the
-- judgment of the dead named at the seventh trumpet (11:18) is the great white
-- throne judgment Yahuah (LORD) sets AFTER the thousand-year reign (Rev 20:11-12),
-- not a pre-millennial/dispensational sequence.
--
-- This migration (1) adds Ezekiel 37 two-stick cross_references to the witnesses
-- thread, (2) UPDATEs the summary_md + title of the four affected live threads to
-- the two-house frame, and (3) links the new cross_references into the witnesses
-- thread. Idempotent: ON CONFLICT DO NOTHING for inserts; UPDATEs are by slug.
-- The source fragment scratch_xref_revelation/minion_revelation_11.sql is edited
-- to match (the session224 migration text is left as the historical record;
-- this file is the authoritative correction, exactly as session218 corrected the
-- Acts-15 council frame after session217).
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session225_revelation11_two_witnesses_frame.sql
-- =====================================================================

\echo 'session225 — Revelation 11 two-witnesses two-house frame revision starting...'
BEGIN;

CREATE TEMP VIEW _s225_rev11fix_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon');

-- ----- (1) new cross_references: Rev 11:3-4 -> Ezekiel 37 two sticks / two houses -----
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon', 'revelation', 11, 3, 'canon', 'ezekiel', 37, 16, 'free', E'*Moreover, thou son of Adam, take thee one stick, and write upon it, For Yahudah (Judah), and for the children of Yashar''el (Israel) his companions: then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel) his companions* (Ezekiel 37:16). Yahuah (LORD) gave Ezekiel two sticks — one for Yahudah (Judah), one for Joseph the stick of Ephraim — the two houses of his divided people. So *I will give power unto my two witnesses, and they shall prophesy a thousand two hundred and threescore days* (Revelation 11:3): the two witnesses are the two sticks, the two houses, raised up to testify; for by two witnesses the testimony is established, and the testimony of Yahudah (Judah) and Ephraim together is the witness of all Yashar''el (Israel).'),
  ('canon', 'revelation', 11, 4, 'canon', 'ezekiel', 37, 17, 'free', E'*And join them one to another into one stick; and they shall become one in thine hand.* (Ezekiel 37:17). The two sticks are joined into one in the prophet''s hand. So the two witnesses are *the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:4) — two trees feeding one lampstand, two houses made one witness. The two candlesticks are the two houses; the joining of the sticks is the regathering of the divided kingdom into one in the hand of Yahuah (LORD).'),
  ('canon', 'revelation', 11, 4, 'canon', 'ezekiel', 37, 19, 'free', E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand.* (Ezekiel 37:19). Yahuah (LORD) himself takes the stick of Joseph in Ephraim''s hand and the stick of Yahudah (Judah) and makes them *one stick... one in mine hand.* The two witnesses who *stand before the Elohim (God) of the earth* (Revelation 11:4) are these two sticks made one — Ephraim and Yahudah (Judah), the two anointed houses, standing as one witness in the hand of their Elohim (God).'),
  ('canon', 'revelation', 11, 3, 'canon', 'ezekiel', 37, 22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The end of the two sticks is one nation under one king — *no more two nations, neither... two kingdoms any more at all.* The two witnesses who *prophesy a thousand two hundred and threescore days, clothed in sackcloth* (Revelation 11:3) testify to that union: the divided kingdom regathered, Yahudah (Judah) and Ephraim made one nation on the mountains of Yashar''el (Israel) under the one King who reigns at the seventh trumpet.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s225_rev11fix_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s225_rev11fix_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- (2a) UPDATE thread 9253 — the two witnesses = the two houses (centerpiece) -----
UPDATE cross_reference_threads SET
  title = E'The two witnesses — the two olive trees and the two candlesticks — the house of Yahudah (Judah) and the house of Yashar''el (Israel) joined as Ezekiel''s two sticks (Ezekiel 37, Zechariah 4)',
  summary_md = E'The two witnesses are named straight out of Zechariah''s lampstand vision: *And I will give power unto my two witnesses, and they shall prophesy a thousand two hundred and threescore days, clothed in sackcloth. These are the two olive trees, and the two candlesticks standing before the Elohim (God) of the earth* (Revelation 11:3-4) — *the two anointed ones, that stand by Yahuah (Lord) of the whole earth* (Zechariah 4:14). And the two anointed who stand before the Lord of all the earth are the two houses of his people: the house of Yahudah (Judah) and the house of Yashar''el (Israel), Ephraim. For Yahuah (LORD) told Ezekiel to take two sticks — *take thee one stick, and write upon it, For Yahudah (Judah)... then take another stick, and write upon it, For Joseph, the stick of Ephraim, and for all the house of Yashar''el (Israel)* (Ezekiel 37:16) — and *join them one to another into one stick; and they shall become one in thine hand* (Ezekiel 37:17). Two sticks, two houses, two witnesses; and the joining is the promise: *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19), *and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two witnesses are not two lone prophets risen for a season — they are the divided kingdom regathered, Yahudah (Judah) and Ephraim made one in the hand of Yahuah (LORD), standing as his two olive trees and bearing his light through the dark days of the treading-down. By two witnesses the testimony is established, and the testimony of the two houses is the witness of all Yashar''el (Israel) restored; they prophesy in the power Zechariah named — *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts)* (Zechariah 4:6) — the lamps of Yahuah (LORD) burning in the night until the kingdom comes.'
 WHERE slug = 'revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4';

-- ----- (2b) UPDATE thread 9256 — the signs are the witness of the Law and the Prophets borne by the two houses -----
UPDATE cross_reference_threads SET
  title = E'Fire out of their mouth, power to shut heaven and to turn the waters to blood — the two houses bearing the witness of the Law and the Prophets (1 Kings 17, Exodus 7)',
  summary_md = E'The two witnesses — the two houses of Yashar''el (Israel) made one — carry the testimony of the whole covenant, the Law and the Prophets, and the signs that attend them are the signs of Mosheh (Moses) and Eliyahu (Elijah), the two who stood for the law and for the prophets. *And if any man will hurt them, fire proceedeth out of their mouth, and devoureth their enemies* (Revelation 11:5): this is the word Yahuah (LORD) put in the prophet''s mouth — *behold, I will make my words in thy mouth fire, and this people wood, and it shall devour them* (Jeremiah 5:14) — the prophetic word itself made fire, and Elijah''s fire, *let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10). *These have power to shut heaven, that it rain not in the days of their prophecy* (Revelation 11:6) — the word of the Tishbite, *there shall not be dew nor rain these years, but according to my word* (1 Kings 17:1). *And have power over waters to turn them to blood, and to smite the earth with all plagues, as often as they will* (Revelation 11:6) — the sign of Moses, *I will smite with the rod that is in mine hand upon the waters which are in the river, and they shall be turned to blood* (Exodus 7:17). The Hebrew library remembered Elijah as fire himself — *Then stood up Elias the prophet as fire, and his word burned like a lamp* (Sirach 48:1), who *by the word of Yahuah (God)... shut up the heaven, and also three times brought down fire* (Sirach 48:3). These are not two lone men returned, but the witness of the Torah and the prophets borne by the two houses together — the law of Moses and the word of the prophets, the two candlesticks burning, Yahudah (Judah) and Ephraim testifying in the power of the Spirit through the appointed days until their testimony is finished.'
 WHERE slug = 'revelation-11-fire-out-of-their-mouth-and-power-over-heaven-moses-and-elijah-1-kings-17';

-- ----- (2c) UPDATE thread 9262 — the raising is the resurrection of the whole house (two houses) -----
UPDATE cross_reference_threads SET
  summary_md = E'The slain witnesses are raised, and the raising is Ezekiel''s valley of dry bones — the resurrection of the whole house of Yashar''el (Israel): *And after three days and an half the Spirit of life from Elohim (God) entered into them, and they stood upon their feet; and great fear fell upon them which saw them* (Revelation 11:11). Yahuah (LORD) said over the bones, *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5), and *the breath came into them, and they lived, and stood up upon their feet, an exceeding great army* (Ezekiel 37:10) — the very words, *stood up upon their feet.* And the same vision that breathed life into the bones joined the two sticks: *these bones are the whole house of Yashar''el (Israel)* (Ezekiel 37:11) — Yahudah (Judah) and Ephraim brought up from their graves and gathered into their own land. So the two witnesses, the two houses, raised and standing are the sign of that great regathering resurrection. Then the ascent: *they heard a great voice from heaven saying unto them, Come up hither. And they ascended up to heaven in a cloud; and their enemies beheld them* (Revelation 11:12) — caught up as Elijah was caught up, *Elijah went up by a whirlwind into heaven* (2 Kings 2:11), *taken up in a whirlwind of fire, and in a chariot of fiery horses* (Sirach 48:9), the prophetic spirit kept *to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). The witnesses raised and vindicated serve that very restoration — the resurrection-power of Yahuah (LORD) shown first in the two houses and then over all his people.'
 WHERE slug = 'revelation-11-the-spirit-of-life-entered-them-and-they-ascended-in-a-cloud-ezekiel-37';

-- ----- (2d) UPDATE thread 9265 — the judgment of the dead (11:18) is the white throne AFTER the millennial reign -----
UPDATE cross_reference_threads SET
  summary_md = E'The seventh trumpet sounds the heart of the whole vision: *And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). This is the stone Daniel saw shatter the image of the kingdoms: *in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* (Daniel 2:44). It is the dominion given to the one *like the Son of Adam*: *there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14) — the kingdom *of his Messiah (Christ)*, the Formed Son receiving from the Father the everlasting reign. It is Zechariah''s day — *Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* (Zechariah 14:9) — and the song of the sea come round at last — *Yahuah (LORD) shall reign for ever and ever* (Exodus 15:18). So the elders fall and give thanks: *We give thee thanks, O Yahuah Elohim (Lord God) Almighty, which art, and wast, and art to come; because thou hast taken to thee thy great power, and hast reigned* (Revelation 11:17). The Father gave his anointed *the heathen for thine inheritance* (Psalm 2:8) and the rod to *dash them in pieces* (Psalm 2:9); so *the nations were angry, and thy wrath is come* (Revelation 11:18), and the kingdom *shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* (Daniel 7:27). And the trumpet names what comes at the end of that reign — *the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints* (Revelation 11:18): this is the great white throne judgment Yahuah (LORD) sets AFTER the thousand-year reign, not before it — *I saw a great white throne, and him that sat on it, from whose face the earth and the heaven fled away* (Revelation 20:11), *and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). The trumpet declares the kingdom come; the judgment of the dead it names is the throne at the reign''s end, where the reward is given to the prophets and the saints and the destroyers of the earth are destroyed. The everlasting reign foretold from the exodus to Daniel is declared come, and its consummation in judgment is set after the millennial reign.'
 WHERE slug = 'revelation-11-the-kingdoms-become-the-kingdoms-of-our-lord-and-of-his-messiah-daniel-2-7';

-- ----- (3) link the new Ezekiel-37 cross_references into the witnesses thread 9253 -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:16 — *take thee one stick... For Yahudah (Judah)... then take another stick... For Joseph, the stick of Ephraim* the two sticks are the two witnesses, the two houses given power to prophesy (Revelation 11:3).'
  FROM cross_reference_threads t, cross_references x, _s225_rev11fix_lookup sv, _s225_rev11fix_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 37:17 — *join them one to another into one stick; and they shall become one in thine hand* the two candlesticks are the two houses made one witness in the hand of Yahuah (LORD) (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s225_rev11fix_lookup sv, _s225_rev11fix_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 37:19 — *I will take the stick of Joseph, which is in the hand of Ephraim... even with the stick of Yahudah (Judah), and make them one stick* the two witnesses standing before the Elohim (God) of the earth are Ephraim and Yahudah (Judah) made one (Revelation 11:4).'
  FROM cross_reference_threads t, cross_references x, _s225_rev11fix_lookup sv, _s225_rev11fix_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Ezekiel 37:22 — *I will make them one nation... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* the testimony of the two witnesses is the divided kingdom regathered into one (Revelation 11:3).'
  FROM cross_reference_threads t, cross_references x, _s225_rev11fix_lookup sv, _s225_rev11fix_lookup tv
 WHERE t.slug='revelation-11-the-two-witnesses-the-two-olive-trees-and-the-two-candlesticks-zechariah-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'session225 — Revelation 11 two-witnesses two-house frame revision complete.'
