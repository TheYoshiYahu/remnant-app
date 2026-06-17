-- =====================================================================
-- Session 416 — "The resurrection keeps the form" full-library cross-references,
-- chapter-end thread, and chapter_intro commentary.
-- =====================================================================
-- Ties John 20 (Thomas and the wounds), Isaiah 56 (the eunuch / dry tree),
-- Matthew 18 + Mark 9 (better maimed into life than whole into the fire) to
-- 2 Baruch 50:2-3 (the dead are raised in the SAME FORM sheol received; the
-- change comes afterward at judgement, 2 Baruch 51). Edition-aware schema;
-- Come-and-See; sacred names restored. Idempotent: ON CONFLICT DO NOTHING and
-- marker-guarded chapter_intro appends.
-- Tier: free (so every reader — and the operator testing it — sees all three
-- surfaces immediately). Re-gate later with an UPDATE on tier_required if the
-- monetization call changes.
-- Apply:  DATABASE_URL='postgresql://...' python3 api/apply_migration.py \
--           ../data-schema/migrations/session416_resurrection_keeps_the_form.sql
-- =====================================================================

\echo 'session416 — resurrection-keeps-the-form starting...'
BEGIN;

CREATE TEMP VIEW _s416_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

-- ----- Layer 1: per-verse cross-references (bidirectional within scripture-level texts) -----
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','john',20,27,'pseudepigrapha','2-baruch',50,2,'free', E'2 Baruch 50:2 — *It shall make no change in their form, But as it has received, so shall it restore them, And as I delivered them unto it, so also shall it raise them.* The risen body keeps the form it went down in — which is why the nail-prints and the spear-wound were still there for Thomas to find.'),
  ('pseudepigrapha','2-baruch',50,2,'canon','john',20,27,'free', E'John 20:27 — *Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* The kept wounds are the resurrection that makes no change in the form, shown in the firstfruits.'),
  ('canon','john',20,25,'pseudepigrapha','2-baruch',50,3,'free', E'2 Baruch 50:3-4 — *...it will be necessary to show to the living that the dead have come to life again... when they have severally recognized those whom they now know.* The dead rise recognizable; Thomas asks to recognize the Messiah by the very marks of the crucifixion.'),
  ('pseudepigrapha','2-baruch',50,3,'canon','john',20,25,'free', E'John 20:25 — *Except I shall see in his hands the print of the nails... and thrust my hand into his side, I will not believe.* Thomas is not doubting the resurrection; he is applying it — a true rising returns the same form, known by its marks.'),
  ('canon','isaiah',56,5,'pseudepigrapha','2-baruch',50,2,'free', E'2 Baruch 50:2 — *It shall make no change in their form...* The eunuch is not made whole in the rising; the form is kept, and the honor comes by a name that is not cut off.'),
  ('pseudepigrapha','2-baruch',50,2,'canon','isaiah',56,5,'free', E'Isaiah 56:5 — *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* The form cut off from offspring is kept; the name endures where sons and daughters could not.'),
  ('canon','matthew',18,8,'pseudepigrapha','2-baruch',50,2,'free', E'2 Baruch 50:2 — *It shall make no change in their form...* You enter life in the form you carried — the maimed limb is not restored at the door, so it is better to enter maimed than to go whole into the fire.'),
  ('pseudepigrapha','2-baruch',50,2,'canon','matthew',18,8,'free', E'Matthew 18:8 — *...it is better for thee to enter into life halt or maimed, rather than having two hands or two feet to be cast into everlasting fire.* Literal in the resurrection that changes no form: enter life maimed, glorified afterward, rather than whole into the fire.'),
  ('canon','mark',9,47,'pseudepigrapha','2-baruch',50,2,'free', E'2 Baruch 50:2 — *It shall make no change in their form...* Enter the kingdom in the form you carried — better with one eye than whole into hell fire.'),
  ('pseudepigrapha','2-baruch',50,2,'canon','mark',9,47,'free', E'Mark 9:47 — *...it is better for thee to enter into the kingdom of Elohim (God) with one eye, than having two eyes to be cast into hell fire:* The rising restores the form unchanged; where you enter in that form is the whole stake.'),
  ('canon','mark',9,47,'pseudepigrapha','2-baruch',51,3,'free', E'2 Baruch 51:3 — *...then their splendour shall be glorified in changes, and the form of their face shall be turned into the light of their beauty...* The change and the glory come AFTER the rising, at the judgement — not at the door of life.'),
  ('canon','isaiah',56,5,'canon','matthew',18,8,'free', E'Matthew 18:8 — *...better for thee to enter into life halt or maimed...* The one cut off in the flesh and the one maimed are the same picture: kept in the form, received into life, honored afterward.'),
  ('canon','matthew',18,8,'canon','isaiah',56,5,'free', E'Isaiah 56:5 — *...a place and a name better than of sons and of daughters... an everlasting name, that shall not be cut off.* The eunuch cut off from sons is the maimed entering life: the form is not the disqualification.'),
  ('canon','john',20,27,'canon','matthew',18,8,'free', E'Matthew 18:8 — *...better for thee to enter into life halt or maimed...* The Messiah enters risen life bearing his wounds — the firstfruits of entering life in the form one carried.'),
  ('canon','matthew',18,8,'canon','john',20,27,'free', E'John 20:27 — *...behold my hands; and reach hither thy hand, and thrust it into my side...* The kept wounds are the pattern: the body is raised in its form, the change reserved for the appointed day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s416_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s416_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- Layer 2: the thread -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'resurrection-keeps-the-form',
       E'The resurrection keeps the form — the change comes at the judgement',
       E'2 Baruch fixes the anthropology the whole canon assumes: the dead are raised in the same form they went down in. *For the earth shall then assuredly restore the dead... It shall make no change in their form, But as it has received, so shall it restore them, And as I delivered them unto it, so also shall it raise them.* (2 Baruch 50:2). They rise recognizable on purpose — *it will be necessary to show to the living that the dead have come to life again... when they have severally recognized those whom they now know* (2 Baruch 50:3-4). The transfiguration — glory for the justified, ruin for the condemned — comes AFTER, at the judgement: *then shall the aspect of those who are condemned be afterwards changed, and the glory of those who are justified.* (2 Baruch 51:1). Hold that one truth and four passages open together.\n\n**Thomas was applying the resurrection, not doubting it.** *Except I shall see in his hands the print of the nails... and thrust my hand into his side, I will not believe.* (John 20:25). If this is truly the same One who was crucified — as sheol received him, so it returns him — then the marks must still be there. And they were: *Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side.* (John 20:27). The wounds remained because the rising makes no change in the form.\n\n**The eunuch is not made whole — he is given a name.** The text does not say the dry tree gets branches or that he ceases to be a eunuch. *...neither let the eunuch say, Behold, I am a dry tree.* (Isaiah 56:3); *Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* (Isaiah 56:5). The form cut off from offspring is kept; the honor comes by a name that endures where sons and daughters could not. The false-inclusion reading turns *a name better than of sons and of daughters* into a foreigner — the nations — granted a name above the seed of promise; that inverts the passage. The *son of the stranger* is the scattered seed estranged in exile, joining himself back to Yahuah; the eunuch is one cut off from posterity within the covenant, kept and named in the house. To read it as the nations elevated over the seed makes Yahuah promise a name above his own covenant people and calls him a liar against the gathering he swore through the prophets.\n\n**"Maimed into life" is literal.** *...it is better for thee to enter into life halt or maimed, rather than having two hands or two feet to be cast into everlasting fire.* (Matthew 18:8); *...better for thee to enter into the kingdom of Elohim (God) with one eye, than having two eyes to be cast into hell fire.* (Mark 9:47). The missing hand or eye is not restored at the door — you enter in the form you carried, and the glory comes afterward. Better to enter life maimed and be transfigured at the appointed day than to go in whole and be cast into the fire. The Messiah''s own kept wounds are the firstfruits of the pattern.',
       sv.verse_id, ev.verse_id, 'free', 41600
  FROM _s416_lookup sv, _s416_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=50 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- Layer 2: thread members (each ties a Layer-1 pair to the thread) -----
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 20:27 ↔ 2 Baruch 50:2 — the kept wounds are the form unchanged in the rising.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-baruch' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 20:25 ↔ 2 Baruch 50:3 — recognized by the marks: "severally recognized those whom they now know."'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=25
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-baruch' AND tv.chapter_number=50 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 56:5 ↔ 2 Baruch 50:2 — the form is not erased; a name that is not cut off.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=5
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-baruch' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 18:8 ↔ 2 Baruch 50:2 — enter life maimed: the form is not repaired at the door.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=18 AND sv.verse_number=8
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-baruch' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Mark 9:47 ↔ 2 Baruch 50:2 — enter the kingdom in the form you carried.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=47
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-baruch' AND tv.chapter_number=50 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Mark 9:47 ↔ 2 Baruch 51:3 — the change and the glory come AFTER, at the judgement.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='mark' AND sv.chapter_number=9 AND sv.verse_number=47
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-baruch' AND tv.chapter_number=51 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Baruch 50:2 ↔ John 20:27 — the firstfruits show the form unchanged: the kept wounds.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=20 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'2 Baruch 50:2 ↔ Isaiah 56:5 — the form kept, a name better than sons and daughters.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'2 Baruch 50:2 ↔ Matthew 18:8 — enter life maimed, glorified afterward, not whole into the fire.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'2 Baruch 50:2 ↔ Mark 9:47 — the rising restores the form; where you enter in it is the stake.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=9 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Isaiah 56:5 ↔ Matthew 18:8 — cut off in the flesh and maimed are one picture: the form is not the disqualification.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=56 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 12, E'John 20:27 ↔ Matthew 18:8 — the Messiah enters risen life bearing his wounds, firstfruits of entering life in one''s form.'
  FROM cross_reference_threads t, cross_references x, _s416_lookup sv, _s416_lookup tv
 WHERE t.slug='resurrection-keeps-the-form'
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- Commentary (chapter_intro) — append-only + marker-guarded so existing intros survive -----
-- John 20
UPDATE chapters SET chapter_intro = COALESCE(NULLIF(chapter_intro,''), '') ||
  CASE WHEN COALESCE(chapter_intro,'') = '' THEN '' ELSE E'\n\n' END ||
  E'## Why Thomas asked for the wounds\n\nThe inherited reading makes Thomas the patron of doubt. He is the opposite. He asks for the wounds because he knows what a true resurrection does — it raises the body in the form it went down in. 2 Baruch says it plainly: *For the earth shall then assuredly restore the dead... It shall make no change in their form, But as it has received, so shall it restore them.* (2 Baruch 50:2). If this is truly the same One who was crucified, the nail-prints and the spear-wound must still be there.\n\n*Except I shall see in his hands the print of the nails, and put my finger into the print of the nails, and thrust my hand into his side, I will not believe.* (John 20:25)\n\nAnd the form was kept:\n\n*Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* (John 20:27)\n\nThe dead come up recognizable on purpose — *it will be necessary to show to the living that the dead have come to life again... when they have severally recognized those whom they now know* (2 Baruch 50:3-4). Thomas recognized him by the marks. The change and the glory come afterward, at the judgement (2 Baruch 51:1) — not at the rising.'
  WHERE id = (SELECT c.id FROM chapters c JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
              WHERE e.slug='canon' AND b.slug='john' AND c.chapter_number=20)
    AND COALESCE(chapter_intro,'') NOT LIKE '%Why Thomas asked for the wounds%';

-- Isaiah 56
UPDATE chapters SET chapter_intro = COALESCE(NULLIF(chapter_intro,''), '') ||
  CASE WHEN COALESCE(chapter_intro,'') = '' THEN '' ELSE E'\n\n' END ||
  E'## The eunuch is not made whole — he is given a name\n\nRead what the text does not say. It does not say the eunuch will cease to be a eunuch, that the dry tree will be given branches, that the form will be repaired. It says he is given a name.\n\n*...neither let the eunuch say, Behold, I am a dry tree.* (Isaiah 56:3)\n\n*Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off.* (Isaiah 56:5)\n\nThe one cut off from carrying seed forward in the flesh keeps the form he carried, and is given a name in the house that does what sons and daughters could not: it is not cut off. Same logic as the rising — *It shall make no change in their form* (2 Baruch 50:2) — the form is not erased; the honor comes by a name that endures.\n\nThe false-inclusion reading takes *a name better than of sons and of daughters* and makes it mean a foreigner — the nations — granted a name above the seed of promise. That inverts the passage. The *son of the stranger* who has joined himself to Yahuah is the scattered seed estranged in exile, the scattered coming home; the eunuch is one cut off from posterity within the covenant who is nonetheless kept and named in the house.\n\n*Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people...* (Isaiah 56:3)\n\nTo read it as the nations elevated over the seed makes Yahuah promise a name above his own covenant people — which calls him a liar against the gathering he swore through the prophets. The passage keeps the seed; it does not replace it.'
  WHERE id = (SELECT c.id FROM chapters c JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
              WHERE e.slug='canon' AND b.slug='isaiah' AND c.chapter_number=56)
    AND COALESCE(chapter_intro,'') NOT LIKE '%The eunuch is not made whole%';

-- Matthew 18 (append — existing intro preserved)
UPDATE chapters SET chapter_intro = COALESCE(NULLIF(chapter_intro,''), '') ||
  CASE WHEN COALESCE(chapter_intro,'') = '' THEN '' ELSE E'\n\n' END ||
  E'## "Maimed into life" is literal\n\nWhy would it be better to enter life maimed than to go whole into the fire? Because the resurrection makes no change in the form. You do not get the hand or the foot back at the door — you enter life in the form you carried.\n\n*Wherefore if thy hand or thy foot offend thee, cut them off, and cast them from thee: it is better for thee to enter into life halt or maimed, rather than having two hands or two feet to be cast into everlasting fire.* (Matthew 18:8)\n\n2 Baruch fixes the anthropology: *It shall make no change in their form, But as it has received, so shall it restore them* (2 Baruch 50:2). The stakes are not whether the body is repaired at the threshold; the stakes are where you enter in your form. Better to enter life maimed and be glorified afterward at the appointed day (2 Baruch 51:3) than to go in whole and be cast into the fire. The Messiah''s own kept wounds are the firstfruits of the pattern.'
  WHERE id = (SELECT c.id FROM chapters c JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
              WHERE e.slug='canon' AND b.slug='matthew' AND c.chapter_number=18)
    AND COALESCE(chapter_intro,'') NOT LIKE '%Maimed into life%';

-- Mark 9
UPDATE chapters SET chapter_intro = COALESCE(NULLIF(chapter_intro,''), '') ||
  CASE WHEN COALESCE(chapter_intro,'') = '' THEN '' ELSE E'\n\n' END ||
  E'## Better maimed into the kingdom than whole into the fire\n\nThe rising raises the body in the form it went down in — *It shall make no change in their form, But as it has received, so shall it restore them* (2 Baruch 50:2) — so entering the kingdom maimed is literal, not figurative.\n\n*And if thine eye offend thee, pluck it out: it is better for thee to enter into the kingdom of Elohim (God) with one eye, than having two eyes to be cast into hell fire:* (Mark 9:47)\n\nThe missing eye is not restored at the door. You enter in the form you carried, and the change — the splendour of the justified — comes afterward, at the judgement: *then their splendour shall be glorified in changes, and the form of their face shall be turned into the light of their beauty* (2 Baruch 51:3). Where you enter in your form is the whole of it. The Messiah rose bearing his wounds; the maimed enter life still maimed, and are glorified after.'
  WHERE id = (SELECT c.id FROM chapters c JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
              WHERE e.slug='canon' AND b.slug='mark' AND c.chapter_number=9)
    AND COALESCE(chapter_intro,'') NOT LIKE '%Better maimed into the kingdom%';

-- 2 Baruch 50 (the anchor)
UPDATE chapters SET chapter_intro = COALESCE(NULLIF(chapter_intro,''), '') ||
  CASE WHEN COALESCE(chapter_intro,'') = '' THEN '' ELSE E'\n\n' END ||
  E'## The form is kept; the change comes at the judgement\n\nThis chapter fixes the anthropology the whole canon assumes. The dead are raised in the same form they went down in:\n\n*For the earth shall then assuredly restore the dead, [Which it now receives, in order to preserve them]. It shall make no change in their form, But as it has received, so shall it restore them, And as I delivered them unto it, so also shall it raise them.* (2 Baruch 50:2)\n\nThey rise recognizable on purpose:\n\n*For then it will be necessary to show to the living that the dead have come to life again, and that those who had departed have returned (again).* (2 Baruch 50:3)\n\nThe transfiguration — glory or ruin — comes afterward, at the judgement, not at the rising:\n\n*...then shall the aspect of those who are condemned be afterwards changed, and the glory of those who are justified.* (2 Baruch 51:1)\n\nHold that and three passages open at once. Thomas asks to see the wounds because a true rising keeps the form, known by its marks (John 20:25-27). The eunuch is not made whole but given a name that is not cut off (Isaiah 56:5). And it is better to enter life maimed than whole into the fire (Matthew 18:8; Mark 9:47), because the limb is not restored at the door — the change is reserved for the appointed day.'
  WHERE id = (SELECT c.id FROM chapters c JOIN books b ON c.book_id=b.id JOIN editions e ON b.edition_id=e.id
              WHERE e.slug='pseudepigrapha' AND b.slug='2-baruch' AND c.chapter_number=50)
    AND COALESCE(chapter_intro,'') NOT LIKE '%The form is kept; the change comes at the judgement%';

COMMIT;
\echo 'session416 — done.'
