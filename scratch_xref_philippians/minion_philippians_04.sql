-- ----- fragment: minion_philippians_04.sql (S231 Philippians 4) -----
-- =====================================================================
-- S231 minion — PHILIPPIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: PHILIPPIANS 4 (23 verses) — the closing exhortation: rejoice in Yahuah (Lord),
--   the peace of Elohim, think on these things, the sweet-savour gift, my Elohim shall supply.
-- Tag: ph04 (temp view _s231_ph04_lookup).
-- Sort band: floor 7635, step 3 (7635, 7638, 7641, 7644 used; under 7660).
-- Source is ALWAYS the canon Philippians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: Paul closes his letter to the called-out ones at Philippi — Israel and the
-- grafted-in seed of the nations, partners in the gospel. The chapter's roots all run back into
-- the Tanakh and the Hebrew library: the names written in the book of life (the heavenly tablets,
-- the book of remembrance), the nearness of Yahuah (Lord) to all who call on him, the peace of
-- the mind stayed on him, the sweet-savour offering ascending from Sinai's altar, and the
-- Shepherd who supplies every need. Same Yahuah, same covenant care; the apostle's exhortation is
-- the Tanakh's own promise re-spoken to the gathered assembly. No replacement theology, no
-- law-vs-grace antithesis — the sweet savour of v.18 is the very burnt-offering odour of Genesis
-- and Leviticus, gathered up into the partners' gift.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   stand fast in Yahuah (Lord); Euodias and Syntyche of the same mind
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted (pastoral, no load-bearing parallel)
--   v.3     whose names are in the book of life
--           Tanakh: Exodus 32:32-33 (blot me out of thy book), Daniel 12:1 (every one found written in
--                   the book), Malachi 3:16 (a book of remembrance written before him)
--           Extras: 1 Enoch 47:3 (the books of the living opened before the Head of Days),
--                   1 Enoch 104:2 (I have beheld the books of life), 1 Enoch 108:3 (their names blotted
--                   out of the book of life) — STRONG extras, the heavenly tablets / books of the living
--           NT: carried in the apparatus elsewhere (Rev 20:12); not duplicated here
--   v.4     rejoice in Yahuah (Lord) alway
--           Tanakh: none warranted (rejoice-in-Yahuah is pervasive but no single load-bearing root for ch4)
--           Extras: none warranted   NT: none warranted
--   v.5-7   Yahuah (Lord) is at hand; the peace of Elohim which passeth all understanding
--           Tanakh: Psalm 145:18 (nigh unto all them that call upon him), Psalm 34:18 (nigh unto them
--                   of a broken heart), Isaiah 26:3 (kept in perfect peace, the mind stayed on thee)
--           Extras: none warranted   NT: none warranted
--   v.8-9   think on these things; the Elohim of peace shall be with you
--           Tanakh: none warranted   Extras: weighed Wisdom on virtue — none warranted (the virtue-list
--                   is paraenetic, no single verse re-spoken)   NT: none warranted
--   v.10-13 content in whatsoever state; I can do all things through Messiah
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--   v.14-18 the sweet-savour gift: an odour of a sweet smell, a sacrifice acceptable
--           Tanakh: Genesis 8:21 (Yahuah smelled a sweet savour), Exodus 29:18 (a sweet savour, an
--                   offering made by fire), Leviticus 1:9 (a burnt sacrifice... of a sweet savour)
--           Extras: none warranted   NT: none warranted
--   v.19    my Elohim shall supply all your need
--           Tanakh: Psalm 23:1 (Yahuah is my shepherd; I shall not want)
--           Extras: none warranted   NT: none warranted
--   v.20-23 doxology and salutations
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7635 philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12   (Tanakh + Extras)  [STRONG extras]
--   7638 philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26  (Tanakh)
--   7641 philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1  (Tanakh)
--   7644 philippians-4-my-elohim-shall-supply-all-your-need-psalm-23  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s231_ph04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12
  ('canon', 'philippians', 4, 3, 'canon', 'exodus', 32, 32, 'free', E'*Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* (Exodus 32:32). Moses knew of a book Yahuah (LORD) had written, in which the names of his people stand; he pleads to be blotted out rather than see Yashar''el (Israel) perish, and Yahuah (LORD) answers, *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). Paul speaks of that same register when he names his fellowlabourers *whose names are in the book of life* (Philippians 4:3). The book Moses appealed to at Sinai is the book in which the Philippian partners are written — one covenant ledger, kept by the same Elohim from the mountain to the assembly.'),
  ('canon', 'philippians', 4, 3, 'canon', 'daniel', 12, 1, 'free', E'*And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). Daniel learns that deliverance in the day of trouble belongs to *every one that shall be found written in the book.* This is the book of life Paul names — *whose names are in the book of life* (Philippians 4:3); to be written there is to be among the delivered people. The labourers in the gospel at Philippi are enrolled in the very book that secures the children of the covenant in the last great trouble.'),
  ('canon', 'philippians', 4, 3, 'canon', 'malachi', 3, 16, 'free', E'*Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). Yahuah (LORD) keeps *a book of remembrance* for those who fear him and think upon his name — and they shall be his *in that day when I make up my jewels* (Malachi 3:17). Paul writes that his fellowlabourers'' *names are in the book of life* (Philippians 4:3): the book of remembrance is the book of life, the register of those who feared Yahuah (LORD) and laboured for his name, gathered as his own treasured jewels.'),
  ('canon', 'philippians', 4, 3, 'enoch', '1-enoch', 47, 3, 'extras', E'*In those days I saw the Head of Days when He seated Himself upon the throne of His glory, And the books of the living were opened before Him: And all His host which is in heaven above and His counsellors stood before Him.* (1 Enoch 47:3). The Hebrew library beholds the same heavenly register: *the books of the living were opened* before the Head of Days enthroned in glory. These are the books Paul appeals to when he says his fellowlabourers'' *names are in the book of life* (Philippians 4:3). The book of life is no metaphor invented late; it is the books of the living that Enoch saw opened before the throne, in which the names of the righteous stand written before Yahuah (God) of Spirits.'),
  ('canon', 'philippians', 4, 3, 'enoch', '1-enoch', 104, 2, 'extras', E'*That I have seen, and the light has shone upon me, And I have seen the holy ones of heaven, And I have beheld the books of life.* (1 Enoch 104:2). Enoch swears to the righteous by what he has been shown — *I have beheld the books of life,* the heavenly record in which the names of the faithful are kept. Paul names the same books when he writes that his fellowlabourers are those *whose names are in the book of life* (Philippians 4:3). The books of life Enoch beheld in the heavens are the ledger in which the Philippian labourers are inscribed; the righteous are not forgotten but written and beheld before Yahuah (God).'),
  ('canon', 'philippians', 4, 3, 'enoch', '1-enoch', 108, 3, 'extras', E'*Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* (1 Enoch 108:3). The library knows the dark side of the register: the names of the wicked *shall be blotted out of the book of life.* To be blotted out is the very judgement Yahuah (LORD) spoke at Sinai — *him will I blot out of my book* (Exodus 32:33). Paul writes the bright side: his fellowlabourers'' *names are in the book of life* (Philippians 4:3), not blotted out but kept, enrolled among the holy ones whose names endure when sin has passed away.'),
  -- thread: philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26
  ('canon', 'philippians', 4, 5, 'canon', 'psalms', 145, 18, 'free', E'*Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth.* (Psalm 145:18). The psalm declares that *Yahuah (LORD) is nigh unto all them that call upon him* — and Paul says simply, *Yahuah (Lord) is at hand* (Philippians 4:5). The nearness that the psalmist confesses is the ground of the apostle''s exhortation: because Yahuah (Lord) is at hand, near to all who call on him in truth, the assembly need *be careful for nothing* but make their requests known. The nigh-at-hand Yahuah (LORD) of the psalm is the Yahuah (Lord) who hears the prayer and supplication of Philippi.'),
  ('canon', 'philippians', 4, 5, 'canon', 'psalms', 34, 18, 'free', E'*Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.* (Psalm 34:18). David sings that *Yahuah (LORD) is nigh unto them that are of a broken heart.* Paul re-speaks the same nearness over the Philippians: *Yahuah (Lord) is at hand* (Philippians 4:5). The One who draws near to the broken and contrite is the One at hand to the anxious assembly; his nearness is why their anxiety may be turned to prayer and their hearts kept in peace.'),
  ('canon', 'philippians', 4, 7, 'canon', 'isaiah', 26, 3, 'free', E'*Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee.* (Isaiah 26:3). Isaiah promises that Yahuah (LORD) *wilt keep him in perfect peace, whose mind is stayed on thee.* This is the peace Paul names: *the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds through HaMashiach Yahusha (Christ Jesus)* (Philippians 4:7). The keeping is the same — the mind stayed on Yahuah (LORD) is kept in perfect peace, the heart guarded by a peace beyond understanding; trust in him, and the peace of Elohim (God) stands sentinel over the soul.'),
  -- thread: philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1
  ('canon', 'philippians', 4, 18, 'canon', 'genesis', 8, 21, 'free', E'*And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* (Genesis 8:21). When Noah offered burnt offerings, *Yahuah (LORD) smelled a sweet savour* — the first sacrifice that ascended acceptable before him. Paul receives the gift of the Philippians and calls it *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). The partners'' generosity rises to Elohim (God) as the very sweet savour Yahuah (LORD) smelled at the altar; their giving is worship, an offering wellpleasing in the same sense the Tanakh''s sacrifices were.'),
  ('canon', 'philippians', 4, 18, 'canon', 'exodus', 29, 18, 'free', E'*And thou shalt burn the whole ram upon the altar: it is a burnt offering unto Yahuah (LORD): it is a sweet savour, an offering made by fire unto Yahuah (LORD).* (Exodus 29:18). The consecration offering at the tabernacle is *a sweet savour, an offering made by fire unto Yahuah (LORD).* Paul lays the same priestly language on the Philippians'' gift: *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). What the altar sent up to Yahuah (LORD) as a sweet savour, the partners now send to the apostle and to Elohim (God) — the sacrifice of their love an offering by fire, ascending wellpleasing before him.'),
  ('canon', 'philippians', 4, 18, 'canon', 'leviticus', 1, 9, 'free', E'*But his inwards and his legs shall he wash in water: and the priest shall burn all on the altar, to be a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* (Leviticus 1:9). The law of the burnt offering names it *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD).* Paul uses that exact savour-language for what came from Philippi: *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). The whole sweet-savour system of Leviticus is not left behind but fulfilled in the partners'' offering; their gift is a burnt offering in spirit, ascending of a sweet savour unto Yahuah (LORD).'),
  -- thread: philippians-4-my-elohim-shall-supply-all-your-need-psalm-23
  ('canon', 'philippians', 4, 19, 'canon', 'psalms', 23, 1, 'free', E'*Yahuah Ra''ah (The LORD is my shepherd); I shall not want.* (Psalm 23:1). David confesses the Shepherd who leaves him in no want: *Yahuah Ra''ah (The LORD is my shepherd); I shall not want.* Paul promises the same provision to the giving assembly: *my Elohim (God) shall supply all your need according to his riches in glory by HaMashiach Yahusha (Christ Jesus)* (Philippians 4:19). The Shepherd who lets his sheep want nothing is the Elohim (God) who supplies all the Philippians'' need; because they gave, they shall not want, for the Shepherd of the psalm tends them out of his riches in glory.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s231_ph04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s231_ph04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12',
       E'Whose names are in the book of life — the books of the living (Exodus 32, Daniel 12, Malachi 3, 1 Enoch)',
       E'Paul names his fellowlabourers at Philippi as those *whose names are in the book of life* (Philippians 4:3) — and that book is no late invention but the heavenly register the whole library knows. At Sinai Moses appealed to it: *if not, blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32), and Yahuah (LORD) answered, *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). Daniel learned that deliverance in the last great trouble belongs to *every one that shall be found written in the book* (Daniel 12:1). Malachi saw it kept for the faithful: *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16), who shall be his *in that day when I make up my jewels* (Malachi 3:17). The Hebrew library beheld the very same books opened before the throne: *the books of the living were opened* before the Head of Days seated in glory (1 Enoch 47:3), and Enoch swore by what he saw — *I have beheld the books of life* (1 Enoch 104:2). He knew the dark side too, the wicked whose *names shall be blotted out of the book of life* (1 Enoch 108:3), the same blotting Yahuah (LORD) spoke at Sinai. So when Paul says the Philippian partners'' names are in the book of life, he enrolls them in the one covenant ledger that runs from Moses to Daniel to the Head of Days'' throne — the book of remembrance, the books of the living, in which the righteous are written and beheld and kept, not blotted out, gathered as the treasured jewels of Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'extras', 7635
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26',
       E'Yahuah (Lord) is at hand, and the peace that passeth understanding (Psalm 145, 34, Isaiah 26)',
       E'Paul grounds his whole closing exhortation in a single confession of the Tanakh: *Yahuah (Lord) is at hand* (Philippians 4:5). Because Yahuah (Lord) is near, the assembly is to *be careful for nothing; but in every thing by prayer and supplication with thanksgiving let your requests be made known unto Elohim (God)* (Philippians 4:6), and then *the peace of Elohim (God), which passeth all understanding, shall keep your hearts and minds through HaMashiach Yahusha (Christ Jesus)* (Philippians 4:7). The nearness is the psalmist''s: *Yahuah (LORD) is nigh unto all them that call upon him, to all that call upon him in truth* (Psalm 145:18), and *Yahuah (LORD) is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit* (Psalm 34:18). The peace is Isaiah''s: *Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee* (Isaiah 26:3). The thread is one promise re-spoken — the Yahuah (LORD) who is nigh to all who call, who keeps in perfect peace the mind stayed on him, is the Yahuah (Lord) at hand to anxious Philippi, guarding their hearts with a peace beyond understanding.',
       sv.verse_id, ev.verse_id, 'free', 7638
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1',
       E'An odour of a sweet smell, a sacrifice acceptable (Genesis 8, Exodus 29, Leviticus 1)',
       E'When Paul receives the gift the Philippians sent by Epaphroditus, he names it in the language of the altar: *an odour of a sweet smell, a sacrifice acceptable, wellpleasing to Elohim (God)* (Philippians 4:18). That sweet savour is the Tanakh''s own. It rose first from Noah''s altar: *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21), the first offering received acceptable after the flood. It was the appointed language of the tabernacle: the consecration ram burned whole is *a sweet savour, an offering made by fire unto Yahuah (LORD)* (Exodus 29:18), and the law of the burnt offering names it *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD)* (Leviticus 1:9). Paul lays this whole sweet-savour system upon the partners'' generosity: their giving is not mere assistance but worship, a burnt offering in spirit, ascending wellpleasing before Elohim (God). The savour Yahuah (LORD) smelled at Noah''s altar and over Sinai''s fire is the savour of the Philippians'' love — the sacrifice of the gathered, acceptable and wellpleasing, the Torah''s offering fulfilled in the fellowship of the gospel.',
       sv.verse_id, ev.verse_id, 'free', 7641
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'philippians-4-my-elohim-shall-supply-all-your-need-psalm-23',
       E'My Elohim (God) shall supply all your need — the Shepherd who leaves no want (Psalm 23)',
       E'Paul answers the partners'' generosity with a promise: *my Elohim (God) shall supply all your need according to his riches in glory by HaMashiach Yahusha (Christ Jesus)* (Philippians 4:19). The promise is David''s confession brought forward — *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* (Psalm 23:1). The Shepherd who tends his sheep so that they want nothing is the Elohim (God) who supplies all the Philippians'' need; because they gave out of their own want (they *sent once and again* unto Paul''s necessity, 4:16), they themselves shall not want, for the Shepherd of the psalm leads them and feeds them out of his riches in glory. The covenant care of Yahuah (LORD) the Shepherd is the apostle''s assurance to the giving assembly: those who pour out for the gospel are kept by the One who lets his flock lack nothing.',
       sv.verse_id, ev.verse_id, 'free', 7644
  FROM _s231_ph04_lookup sv, _s231_ph04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='philippians' AND ev.chapter_number=4 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *blot me, I pray thee, out of thy book which thou hast written* the book Yahuah (LORD) wrote at Sinai; the Philippian labourers'' *names are in the book of life* (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *every one that shall be found written in the book* the delivered people in the day of trouble; those *whose names are in the book of life* (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:16 — *a book of remembrance was written before him for them that feared Yahuah (LORD)* the book of remembrance = the book of life in which the labourers are kept (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 47:3 — *the books of the living were opened before Him* before the Head of Days enthroned; the same books, those *whose names are in the book of life* (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 104:2 — *I have beheld the books of life* the heavenly record of the righteous; the book in which the Philippian labourers are enrolled (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=104 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 108:3 — *their names shall be blotted out of the book of life* the dark side of the register (cf. Exodus 32:33); the labourers'' names kept, not blotted out (Philippians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-whose-names-are-in-the-book-of-life-exodus-32-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 145:18 — *Yahuah (LORD) is nigh unto all them that call upon him* the nearness behind *Yahuah (Lord) is at hand* (Philippians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 34:18 — *Yahuah (LORD) is nigh unto them that are of a broken heart* the near Yahuah (LORD) re-spoken as *Yahuah (Lord) is at hand* (Philippians 4:5).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 26:3 — *Thou wilt keep him in perfect peace, whose mind is stayed on thee* the peace that *passeth all understanding, shall keep your hearts and minds* (Philippians 4:7).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-the-lord-is-at-hand-and-the-peace-that-passeth-understanding-psalm-145-isaiah-26'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:21 — *Yahuah (LORD) smelled a sweet savour* the first offering received acceptable; the Philippians'' gift *an odour of a sweet smell, a sacrifice acceptable* (Philippians 4:18).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 29:18 — *a sweet savour, an offering made by fire unto Yahuah (LORD)* the tabernacle''s savour-language laid on the partners'' gift (Philippians 4:18).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 1:9 — *a burnt sacrifice, an offering made by fire, of a sweet savour unto Yahuah (LORD)* the law of the burnt offering fulfilled in the gift *wellpleasing to Elohim (God)* (Philippians 4:18).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-an-odour-of-a-sweet-smell-a-sacrifice-acceptable-genesis-8-leviticus-1'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: philippians-4-my-elohim-shall-supply-all-your-need-psalm-23
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 23:1 — *Yahuah Ra''ah (The LORD is my shepherd); I shall not want* the Shepherd who leaves no want; *my Elohim (God) shall supply all your need* (Philippians 4:19).'
  FROM cross_reference_threads t, cross_references x, _s231_ph04_lookup sv, _s231_ph04_lookup tv
 WHERE t.slug='philippians-4-my-elohim-shall-supply-all-your-need-psalm-23'
   AND sv.edition_slug='canon' AND sv.book_slug='philippians' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
