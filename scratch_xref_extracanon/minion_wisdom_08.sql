-- ----- fragment: minion_thewisdomofsolomon_08.sql (session253 the-wisdom-of-solomon 8) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis08 (view _session253_wis08_lookup). Sort band base 58175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-8-orders-all-things-the-logos
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'apocrypha', 'the-wisdom-of-solomon', 7, 25, 'extras', E'Wisdom of Solomon 7:25 — *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* The wisdom who orders all things end-to-end in 8:1 is the same breath of Elohim''s power, so her sweet governance is the operation of the divine Logos.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'apocrypha', 'the-wisdom-of-solomon', 7, 26, 'extras', E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The reaching, ordering Wisdom of 8:1 is the radiance and image of Elohim — the formed Wisdom the NT names the Word.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* The Wisdom that sweetly orders all things in 8:1 is the same craftsman who was beside Yahuah ordering creation from the beginning.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Wisdom reaching from end to end and ordering all things in 8:1 is named by John as the Word who was with Elohim and was Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 1, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Wisdom who ordereth all things sweetly in 8:1 is the One by whom and for whom all things were made.'),
  -- thread: wisdom-8-solomon-loves-her-as-spouse
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'canon', 'proverbs', 4, 6, 'free', E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* Solomon''s desire to make Wisdom his spouse in 8:2 is the Proverbs charge to love her so that she preserves and keeps the one who holds her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'canon', 'proverbs', 4, 8, 'free', E'Proverbs 4:8 — *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her.* The bride imagery of 8:2 — loving her beauty and embracing her — is the Proverbs promise that embracing Wisdom brings honour.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'apocrypha', 'the-wisdom-of-solomon', 6, 12, 'extras', E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* The youth who sought her out and loved her beauty in 8:2 is the lover whom 6:12 promises will easily find her.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 2, 'apocrypha', 'the-wisdom-of-solomon', 6, 18, 'extras', E'Wisdom of Solomon 6:18 — *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* The love of Wisdom that Solomon professes in 8:2 is defined within the same book as the keeping of her laws — Torah-fidelity, not mere affection.'),
  -- thread: wisdom-8-privy-to-the-mysteries-of-elohim
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'apocrypha', 'ecclesiasticus', 24, 3, 'extras', E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* The Wisdom privy to the mysteries of Yahuah in 8:4 is the same who in Sirach proceeds from the mouth of the Most High to fill the earth.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'apocrypha', 'ecclesiasticus', 24, 8, 'extras', E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* The Wisdom conversant with Yahuah in 8:3 is given her dwelling among the covenant people — election kept, not a church replacing Israel.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'canon', '1-corinthians', 1, 24, 'free', E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom privy to the mysteries of Elohim in 8:4 is named the wisdom of Elohim — Messiah Himself.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 4, 'canon', 'colossians', 2, 3, 'free', E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge.* The mysteries of the knowledge of Yahuah to which Wisdom is privy in 8:4 are the treasures hid in Messiah.'),
  -- thread: wisdom-8-teaches-temperance-prudence-justice-fortitude
  ('apocrypha', 'the-wisdom-of-solomon', 8, 7, 'canon', '1-kings', 3, 9, 'free', E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* The justice and prudence Wisdom teaches in 8:7 is the very discerning heart Solomon asked of Yahuah at Gibeon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 7, 'canon', '1-kings', 3, 12, 'free', E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The virtues Wisdom imparts in 8:7 are the wise and understanding heart Yahuah granted Solomon above all men.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 8, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The wisdom that knows things of old and what is to come in 8:8 is the gift James says is freely given to any who ask Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 8, 'apocrypha', 'ecclesiasticus', 24, 4, 'extras', E'Ecclesiasticus 24:4 — *I dwelt in high places, and my throne is in a cloudy pillar.* The Wisdom who foresees signs, wonders, and the events of seasons in 8:8 is the same enthroned heavenly Wisdom of Sirach 24, surveying the times from on high.'),
  -- thread: wisdom-8-immortality-and-prayer-to-obtain
  ('apocrypha', 'the-wisdom-of-solomon', 8, 21, 'apocrypha', 'the-wisdom-of-solomon', 9, 9, 'extras', E'Wisdom of Solomon 9:9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* The prayer Solomon begins in 8:21 unfolds in chapter 9, confessing that Wisdom was present at creation and knows Yahuah''s commandments.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 13, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality Wisdom secures in 8:13 is the same resurrection hope of chapter 3, the righteous kept safe in Elohim''s hand.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 17, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The alliance with wisdom that is immortality in 8:17 is grounded in the prophetic promise of resurrection to everlasting life.'),
  ('apocrypha', 'the-wisdom-of-solomon', 8, 21, 'apocrypha', 'the-wisdom-of-solomon', 6, 19, 'extras', E'Wisdom of Solomon 6:19 — *And incorruption makes us near to Yahuah (God):* Solomon''s plea to obtain Wisdom as the gift of Elohim in 8:21 reaches toward the incorruption that 6:19 says brings the seeker near to Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-orders-all-things-the-logos',
       E'Wisdom reacheth from end to end and ordereth all things — the Formed Logos',
       E'Solomon opens chapter 8 with the cosmic reach of Wisdom: *Wisdom reacheth from one end to another mightily: and sweetly does she order all things.* (Wisdom of Solomon 8:1) She is no abstraction but the same Formed Wisdom of chapter 7 — *she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* (Wisdom of Solomon 7:25) and *she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* (Wisdom of Solomon 7:26) This is the very figure of Proverbs, the craftsman daily delighting before Yahuah at the founding of the world — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* (Proverbs 8:30) The NT names her plainly: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) and *All things were made by him; and without him was not any thing made that was made.* (John 1:3) — the One by whom and for whom all was created, *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* (Colossians 1:16). It ain''t new: the deuterocanon already confessed the ordering Word.',
       sv.verse_id, ev.verse_id, 'extras', 58175
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-solomon-loves-her-as-spouse',
       E'I desired to make her my spouse — love her and she shall preserve thee',
       E'Solomon courts Wisdom as a bride: *I loved her, and sought her out from my youth, I desired to make her my spouse, and I was a lover of her beauty.* (Wisdom of Solomon 8:2) She is the LiveLikeMessiah delight, the one to be embraced — Proverbs gives the same nuptial charge: *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* (Proverbs 4:6) and *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her.* (Proverbs 4:8) Within the apocrypha itself she answers those who love her early — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* (Wisdom of Solomon 6:12). The love is not sentiment but Torah-keeping: *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* (Wisdom of Solomon 6:18) — the same covenant fidelity the whole library guards.',
       sv.verse_id, ev.verse_id, 'extras', 58178
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-privy-to-the-mysteries-of-elohim',
       E'Privy to the mysteries of Yahuah — in whom are hid all the treasures',
       E'Wisdom is kin to Elohim and keeper of His counsels: *In that she is conversant with Yahuah (God), she magnifies her nobility: yes, Yahuah (God) of all things himself loved her.* (Wisdom of Solomon 8:3) and *For she is privy to the mysteries of the knowledge of Yahuah (God), and a lover of his works.* (Wisdom of Solomon 8:4) Sirach makes her the very word from the divine mouth, given an inheritance in the covenant people — *I came out of the mouth of the Most High, and covered the earth as a cloud.* (Ecclesiasticus 24:3) and *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* (Ecclesiasticus 24:8). The NT seals it: this hidden mystery is Messiah, *Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* (1 Corinthians 1:24), *In whom are hid all the treasures of wisdom and knowledge.* (Colossians 2:3). The mysteries to which Wisdom is privy are hid in Him.',
       sv.verse_id, ev.verse_id, 'extras', 58181
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-teaches-temperance-prudence-justice-fortitude',
       E'She teacheth the virtues — knoweth things of old and what is to come',
       E'Wisdom is the teacher of the cardinal virtues and the discerner of times: *And if a man love righteousness her labours are virtues: for she teaches temperance and prudence, justice and fortitude: which are such things, as men can have nothing more profitable in their life.* (Wisdom of Solomon 8:7) and *If a man desire much experience, she knoweth things of old, and conjectureth aright what is to come: she knoweth the subtilties of speeches, and can expound dark sentences: she foreseeth signs and wonders, and the events of seasons and times.* (Wisdom of Solomon 8:8) This is exactly what Solomon begged of Yahuah at Gibeon — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* (1 Kings 3:9) — and which was granted, *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* (1 Kings 3:12). Such wisdom is still ours for the asking: *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* (James 1:5).',
       sv.verse_id, ev.verse_id, 'extras', 58184
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-8-immortality-and-prayer-to-obtain',
       E'By her immortality — Solomon prays to obtain the gift of Elohim',
       E'Solomon''s pursuit ends where it must, in immortality and in prayer: *Moreover by the means of her I shall obtain immortality, and leave behind me an everlasting memorial to them that come after me.* (Wisdom of Solomon 8:13) and *Now when I considered these things in myself, and pondered them in my heart, how that to be allied to wisdom is immortality;* (Wisdom of Solomon 8:17). For Wisdom cannot be seized, only received as gift — *Nevertheless, when I perceived that I could not otherwise obtain her, except Yahuah (God) gave her me; and that was a point of wisdom also to know whose gift she was; I prayed to Yahuah (God), and besought him, and with my whole heart I said,* (Wisdom of Solomon 8:21). Within the book this prayer breaks open into chapter 9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* (Wisdom of Solomon 9:9). The immortality wisdom secures is the resurrection hope the whole library carries — *the souls of the righteous are in the hand of Yahuah (God)* (Wisdom of Solomon 3:1) — answered in the prophets: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 58187
  FROM _session253_wis08_lookup sv, _session253_wis08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-8-orders-all-things-the-logos
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 7:25 — *For she is the breath of the power of Yahuah (God), and a pure influence flowing from the glory of the Almighty: therefore can no defiled thing fall into her.* The wisdom who orders all things end-to-end in 8:1 is the same breath of Elohim''s power, so her sweet governance is the operation of the divine Logos.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 7:26 — *For she is the brightness of the everlasting light, the unspotted mirror of the power of Yahuah (God), and the image of his goodness.* The reaching, ordering Wisdom of 8:1 is the radiance and image of Elohim — the formed Wisdom the NT names the Word.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* The Wisdom that sweetly orders all things in 8:1 is the same craftsman who was beside Yahuah ordering creation from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Wisdom reaching from end to end and ordering all things in 8:1 is named by John as the Word who was with Elohim and was Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him:* The Wisdom who ordereth all things sweetly in 8:1 is the One by whom and for whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-orders-all-things-the-logos'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-solomon-loves-her-as-spouse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 4:6 — *Forsake her not, and she shall preserve thee: love her, and she shall keep thee.* Solomon''s desire to make Wisdom his spouse in 8:2 is the Proverbs charge to love her so that she preserves and keeps the one who holds her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 4:8 — *Exalt her, and she shall promote thee: she shall bring thee to honour, when thou dost embrace her.* The bride imagery of 8:2 — loving her beauty and embracing her — is the Proverbs promise that embracing Wisdom brings honour.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 6:12 — *Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* The youth who sought her out and loved her beauty in 8:2 is the lover whom 6:12 promises will easily find her.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:18 — *And love is the keeping of her laws; and the giving heed to her laws is the assurance of incorruption;* The love of Wisdom that Solomon professes in 8:2 is defined within the same book as the keeping of her laws — Torah-fidelity, not mere affection.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-solomon-loves-her-as-spouse'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-privy-to-the-mysteries-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:3 — *I came out of the mouth of the Most High, and covered the earth as a cloud.* The Wisdom privy to the mysteries of Yahuah in 8:4 is the same who in Sirach proceeds from the mouth of the Most High to fill the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:8 — *So the Creator of all things gave me a commandment, and he that made me caused my tabernacle to rest, and said, Let your dwelling be in Jacob, and your inheritance in Yashar''el (Israel).* The Wisdom conversant with Yahuah in 8:3 is given her dwelling among the covenant people — election kept, not a church replacing Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:24 — *But unto them which are called, both Yahudim (Jews) and Greeks, Messiah (Christ) the power of Elohim (God), and the wisdom of Elohim (God).* The Wisdom privy to the mysteries of Elohim in 8:4 is named the wisdom of Elohim — Messiah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 2:3 — *In whom are hid all the treasures of wisdom and knowledge.* The mysteries of the knowledge of Yahuah to which Wisdom is privy in 8:4 are the treasures hid in Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-privy-to-the-mysteries-of-elohim'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-teaches-temperance-prudence-justice-fortitude
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* The justice and prudence Wisdom teaches in 8:7 is the very discerning heart Solomon asked of Yahuah at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 3:12 — *Behold, I have done according to thy words: lo, I have given thee a wise and an understanding heart; so that there was none like thee before thee, neither after thee shall any arise like unto thee.* The virtues Wisdom imparts in 8:7 are the wise and understanding heart Yahuah granted Solomon above all men.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:5 — *If any of you lack wisdom, let him ask of Elohim (God), that giveth to all men liberally, and upbraideth not; and it shall be given him.* The wisdom that knows things of old and what is to come in 8:8 is the gift James says is freely given to any who ask Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:4 — *I dwelt in high places, and my throne is in a cloudy pillar.* The Wisdom who foresees signs, wonders, and the events of seasons in 8:8 is the same enthroned heavenly Wisdom of Sirach 24, surveying the times from on high.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-teaches-temperance-prudence-justice-fortitude'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-8-immortality-and-prayer-to-obtain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 9:9 — *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments.* The prayer Solomon begins in 8:21 unfolds in chapter 9, confessing that Wisdom was present at creation and knows Yahuah''s commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality Wisdom secures in 8:13 is the same resurrection hope of chapter 3, the righteous kept safe in Elohim''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The alliance with wisdom that is immortality in 8:17 is grounded in the prophetic promise of resurrection to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:19 — *And incorruption makes us near to Yahuah (God):* Solomon''s plea to obtain Wisdom as the gift of Elohim in 8:21 reaches toward the incorruption that 6:19 says brings the seeker near to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis08_lookup sv, _session253_wis08_lookup tv
 WHERE t.slug='wisdom-8-immortality-and-prayer-to-obtain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

