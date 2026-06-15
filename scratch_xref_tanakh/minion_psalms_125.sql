-- ----- fragment: minion_psalms_125.sql (Psalm 125) -----
-- Chapter: Psalm 125 — Song of Ascents: the immovable, encircled covenant people
-- Tag: ps125   Session: s302   Slug prefix: psalm-125-   Sort band base: 25100 (25100,25103,25106,25109)
--
-- Psalm 125 coverage:
--   v.1  (trust in Yahuah = mount Zion, cannot be removed, abideth for ever)
--        NT:     Hebrews 12:28 (kingdom which cannot be moved); Matthew 7:24-25 (house on the rock) — THREAD A
--        Extras: none warranted (NT + lateral carry the unshakeable-kingdom weight cleanly)
--        Tanakh: Psalm 46:5 (Elohim in the midst of her; she shall not be moved) — THREAD A
--   v.2  (mountains round about Jerusalem, so Yahuah round about his people for ever)
--        NT:     Romans 11:1-2 (Elohim hath not cast away his people which he foreknew — the guard) — THREAD B
--        Extras: none warranted (theophanic-guard + two-house weight carried by canon prophets)
--        Tanakh: Zechariah 2:5 (a wall of fire round about); Deuteronomy 33:27 (underneath the everlasting arms);
--                Ezekiel 37:22 (one nation, no more two — the whole encircled two-house people) — THREAD B
--   v.3  (rod of the wicked shall not rest upon the lot of the righteous; lest they put forth hands to iniquity)
--        NT:     1 Corinthians 10:13 (no temptation above what ye are able; a way to escape) — THREAD C
--        Extras: none warranted
--        Tanakh: Numbers 26:55 (the land divided by lot, by the names of the tribes — the inheritance/lot preserved) — THREAD C
--                (Deuteronomy 32:9 Jacob the lot of his inheritance considered but NOT added as member: that parse
--                 still reads un-restored "the LORD'S portion" — named in prose only, not quoted/threaded)
--   v.4-5 (do good to the good; the crooked led forth with workers of iniquity; BUT peace upon Yashar'el)
--        NT:     Matthew 7:23 (depart from me, ye that work iniquity — the two ways' end);
--                Galatians 6:16 (peace... upon the Yashar'el of Elohim); Romans 11:1-2 (guard against replacement) — THREAD D
--        Extras: none warranted
--        Tanakh: Psalm 1:6 (Yahuah knoweth the way of the righteous; the way of the ungodly shall perish — the two ways);
--                Psalm 128:6 (peace upon Yashar'el — the lateral Ascent benediction) — THREAD D
--
-- Threads (4):
--   A psalm-125-they-that-trust-shall-be-as-mount-zion-the-kingdom-that-cannot-be-moved  [canon NT+Tanakh]  free
--   B psalm-125-as-the-mountains-round-about-jerusalem-yahuah-round-about-his-people     [canon NT+Tanakh]  free
--   C psalm-125-the-rod-of-the-wicked-shall-not-rest-upon-the-lot-of-the-righteous       [canon NT+Tanakh]  free
--   D psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel                            [canon NT+Tanakh]  free
-- All members canon (Tanakh + NT) → every thread tier_required='free'. No extras members in this chapter.

CREATE TEMP VIEW _s302_ps125_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD A — v.1 mount Zion, the kingdom that cannot be moved
    ('canon','psalms',125,1,'canon','hebrews',12,28,'free',
     E'*Wherefore we receiving a kingdom which cannot be moved, let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28). Psalm 125 opens, *They that trust in Yahuah (LORD) shall be as mount Zion, which cannot be removed, but abideth for ever* (Psalm 125:1) — the same immovability. The trust that fastens to Yahuah is fastened to the one kingdom that the shaking of all made things cannot move; Zion is not real estate but the covenant people set on the unshakeable Rock.'),
    ('canon','psalms',125,1,'canon','matthew',7,24,'free',
     E'*Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24). The Formed Son makes the same point Psalm 125 sings: *They that trust in Yahuah (LORD) shall be as mount Zion, which cannot be removed* (Psalm 125:1) — and the trust that cannot be removed is the trust that *heareth* AND *doeth* (1 John 2:3-4), the doer, not the hearer only, founded on the Rock.'),
    ('canon','psalms',125,1,'canon','matthew',7,25,'free',
     E'*And the rain descended, and the floods came, and the winds blew, and beat upon that house; and it fell not: for it was founded upon a rock* (Matthew 7:25). Every storm strikes and *it fell not* — the very *cannot be removed, but abideth for ever* of *They that trust in Yahuah (LORD) shall be as mount Zion* (Psalm 125:1). The foundation, not the weather, decides who stands.'),
    ('canon','psalms',125,1,'canon','psalms',46,5,'free',
     E'*Elohim (God) is in the midst of her; she shall not be moved: Elohim (God) shall help her, and that right early* (Psalm 46:5). The sister psalm names why Zion *cannot be removed* (Psalm 125:1): not her own strength but the Presence in her midst — *she shall not be moved* because *Elohim (God) is in the midst of her*.'),
    -- THREAD B — v.2 Yahuah round about his people, the encircling guard of the two-house people
    ('canon','psalms',125,2,'canon','zechariah',2,5,'free',
     E'*For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her* (Zechariah 2:5). Psalm 125 draws the map — *As the mountains are round about Jerusalem, so Yahuah (LORD) is round about his people from henceforth even for ever* (Psalm 125:2) — and Zechariah makes the encircling mountains a *wall of fire round about*: Yahuah himself, the Formed Glory in the midst, is the wall a city without walls (Zechariah 2:4) needs no other.'),
    ('canon','psalms',125,2,'canon','deuteronomy',33,27,'free',
     E'*The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms: and he shall thrust out the enemy from before thee; and shall say, Destroy them* (Deuteronomy 33:27). Moses'' blessing on the tribes is the same encirclement Psalm 125 sings — *so Yahuah (LORD) is round about his people from henceforth even for ever* (Psalm 125:2): round about on every side, *underneath* the everlasting arms, the covenant people held within Yahuah on all hands.'),
    ('canon','psalms',125,2,'canon','ezekiel',37,22,'free',
     E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The *people* Yahuah is *round about... for ever* (Psalm 125:2) is the whole house — Yahudah and the scattered north made one again on the mountains, the two sticks become one. The encircling guard surrounds the regathered twelve tribes, not a replacement people.'),
    ('canon','psalms',125,2,'canon','romans',11,1,'free',
     E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). *From henceforth even for ever* (Psalm 125:2) leaves no room for casting-off: the people Yahuah stands *round about* is the people he never cast away. Paul guards Psalm 125 against the replacement reading — *his people which he foreknew* are kept, not exchanged.'),
    -- THREAD C — v.3 the rod of the wicked, the lot of the righteous preserved
    ('canon','psalms',125,3,'canon','numbers',26,55,'free',
     E'*Notwithstanding the land shall be divided by lot: according to the names of the tribes of their fathers they shall inherit* (Numbers 26:55). The *lot of the righteous* Psalm 125:3 guards is the tribal inheritance itself — *the lot* assigned by name to the fathers'' tribes. The promise of verse 3, *the rod of the wicked shall not rest upon the lot of the righteous*, is that no oppressor''s rule will be allowed to settle permanently on Jacob''s portion.'),
    ('canon','psalms',125,3,'canon','1-corinthians',10,13,'free',
     E'*There hath no temptation taken you but such as is common to man: but Elohim (God) is faithful, who will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape, that ye may be able to bear it* (1 Corinthians 10:13). Psalm 125:3 gives the reason the rod is held back — *lest the righteous put forth their hands unto iniquity*: Yahuah measures the pressure so the upright are not driven past bearing into sin. The faithful Elohim *will not suffer* a testing beyond strength.'),
    -- THREAD D — v.4-5 the two ways; the crooked led forth with the workers of iniquity; but peace upon Yashar'el
    ('canon','psalms',125,4,'canon','psalms',1,6,'free',
     E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). Psalm 125 ends where Psalm 1 begins — the two ways. *Do good, O Yahuah (LORD), unto those that be good, and to them that are upright in their hearts* (Psalm 125:4) is the way Yahuah *knoweth*; the *crooked ways* of verse 5 are the way that *shall perish*.'),
    ('canon','psalms',125,5,'canon','matthew',7,23,'free',
     E'*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23). The Formed Son speaks Psalm 125''s sentence on the crooked: *As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity* (Psalm 125:5). To be *led forth with the workers of iniquity* is to hear *depart from me, ye that work iniquity* — the lawless severed from the way Yahuah knows.'),
    ('canon','psalms',125,5,'canon','galatians',6,16,'free',
     E'*And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God)* (Galatians 6:16). Paul pronounces the psalm''s closing benediction — *but peace shall be upon Yashar''el (Israel)* (Psalm 125:5) — over the same Israel: the covenant people who walk by the rule, the *Yashar''el (Israel) of Elohim*, not a new nation but the gathered house on whom the *shalom* rests.'),
    ('canon','psalms',125,5,'canon','psalms',128,6,'free',
     E'*Yea, thou shalt see thy children''s children, and peace upon Yashar''el (Israel)* (Psalm 128:6). Three Ascents on, the same word closes — *peace upon Yashar''el (Israel)* (Psalm 128:6) answering *but peace shall be upon Yashar''el (Israel)* (Psalm 125:5). The Songs of Ascents end again and again on the one shalom resting on the whole house.'),
    ('canon','psalms',125,5,'canon','romans',11,2,'free',
     E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The *peace... upon Yashar''el (Israel)* (Psalm 125:5) rests on a people Yahuah has not abandoned. Paul guards the benediction from the replacement reading: the Israel on whom shalom abides is the foreknown people, kept, never cast off.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps125_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps125_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-125-they-that-trust-shall-be-as-mount-zion-the-kingdom-that-cannot-be-moved',
       E'They that trust in Yahuah shall be as mount Zion — the kingdom that cannot be moved',
       E'*They that trust in Yahuah (LORD) shall be as mount Zion, which cannot be removed, but abideth for ever* (Psalm 125:1). The Song of Ascents opens on the one immovable thing: not the trusting one''s strength, but the One trusted. To trust Yahuah is to be set on Zion, and Zion *cannot be removed*.\n\nHebrews names the kingdom by the same mark: *Wherefore we receiving a kingdom which cannot be moved, let us have grace, whereby we may serve Elohim (God) acceptably with reverence and godly fear* (Hebrews 12:28). When all made things are shaken, this remains. The Formed Son builds it: *whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24), and when the storm beats, *it fell not: for it was founded upon a rock* (Matthew 7:25) — the trust that *doeth*, not hears only (1 John 2:3-4).\n\nThe sister psalm tells why Zion stands: *Elohim (God) is in the midst of her; she shall not be moved: Elohim (God) shall help her, and that right early* (Psalm 46:5). The Presence in her midst, not her own foundation, makes her unmovable for ever.',
       sv.verse_id, ev.verse_id, 'free', 25100
  FROM _s302_ps125_lookup sv, _s302_ps125_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=125 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-125-as-the-mountains-round-about-jerusalem-yahuah-round-about-his-people',
       E'As the mountains round about Jerusalem — Yahuah round about his people for ever',
       E'*As the mountains are round about Jerusalem, so Yahuah (LORD) is round about his people from henceforth even for ever* (Psalm 125:2). The geography preaches: the ring of hills that hems the city is a picture of Yahuah himself encircling his people on every side, without end.\n\nZechariah turns the ring into fire: *For I, saith Yahuah (LORD), will be unto her a wall of fire round about, and will be the glory in the midst of her* (Zechariah 2:5) — the Formed Glory in the midst, the encircling wall a city without walls needs no other. Moses had already blessed the tribes with the same encirclement: *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms: and he shall thrust out the enemy from before thee* (Deuteronomy 33:27) — round about, and *underneath* the everlasting arms.\n\nAnd the *people* so surrounded is the whole house: *I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations* (Ezekiel 37:22) — Yahudah and the scattered north, the two sticks made one. *From henceforth even for ever* leaves no room for casting-off: *Hath Elohim (God) cast away his people? Elohim (God) forbid... Elohim (God) hath not cast away his people which he foreknew* (Romans 11:1-2). The encircling guard surrounds the regathered twelve tribes, never a replacement people.',
       sv.verse_id, ev.verse_id, 'free', 25103
  FROM _s302_ps125_lookup sv, _s302_ps125_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=125 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-125-the-rod-of-the-wicked-shall-not-rest-upon-the-lot-of-the-righteous',
       E'The rod of the wicked shall not rest upon the lot of the righteous',
       E'*For the rod of the wicked shall not rest upon the lot of the righteous; lest the righteous put forth their hands unto iniquity* (Psalm 125:3). Two promises in one breath: the oppressor''s rule is not permitted to settle permanently on the inheritance, and the reason is mercy — lest the pressure drive the upright into sin.\n\nThe *lot* is the tribal inheritance itself: *Notwithstanding the land shall be divided by lot: according to the names of the tribes of their fathers they shall inherit* (Numbers 26:55). Jacob''s portion, assigned by name to the fathers'' tribes, is the very *lot of the righteous* the rod may not rest upon. (*Jacob is the lot of his inheritance* — Deuteronomy 32:9 — sings the same.)\n\nAnd the held-back rod is the faithful measuring of every trial: *There hath no temptation taken you but such as is common to man: but Elohim (God) is faithful, who will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape, that ye may be able to bear it* (1 Corinthians 10:13). Yahuah weighs the weight *lest the righteous put forth their hands unto iniquity* — never beyond bearing.',
       sv.verse_id, ev.verse_id, 'free', 25106
  FROM _s302_ps125_lookup sv, _s302_ps125_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=125 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel',
       E'The two ways — but peace shall be upon Yashar''el',
       E'*Do good, O Yahuah (LORD), unto those that be good, and to them that are upright in their hearts. As for such as turn aside unto their crooked ways, Yahuah (LORD) shall lead them forth with the workers of iniquity: but peace shall be upon Yashar''el (Israel)* (Psalm 125:4-5). The psalm closes on the two ways and a benediction.\n\nIt is the verdict of Psalm 1: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). The upright walk the way Yahuah *knoweth*; the *crooked ways* are the way that *shall perish*. The Formed Son speaks the sentence on the crooked: *And then will I profess unto them, I never knew you: depart from me, ye that work iniquity* (Matthew 7:23) — to be *led forth with the workers of iniquity* is to hear *depart*.\n\nBut the last word is *shalom*: *but peace shall be upon Yashar''el (Israel)* (Psalm 125:5). Paul pronounces it over the same people — *as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God)* (Galatians 6:16) — and the Ascents echo it on, *peace upon Yashar''el (Israel)* (Psalm 128:6). And lest any read the Israel of the blessing as exchanged: *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The peace rests on the whole gathered house.',
       sv.verse_id, ev.verse_id, 'free', 25109
  FROM _s302_ps125_lookup sv, _s302_ps125_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=125 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD A
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Wherefore we receiving a kingdom which cannot be moved* (Hebrews 12:28) — the unshakeable kingdom that *cannot be removed* (Psalm 125:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=1
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-they-that-trust-shall-be-as-mount-zion-the-kingdom-that-cannot-be-moved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Built his house upon a rock* (Matthew 7:24) — the doer who *heareth... and doeth* stands immovable as Zion (Psalm 125:1; 1 John 2:3-4).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=1
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-they-that-trust-shall-be-as-mount-zion-the-kingdom-that-cannot-be-moved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*It fell not: for it was founded upon a rock* (Matthew 7:25) — the storm strikes and it stands, *cannot be removed, but abideth for ever* (Psalm 125:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=1
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-they-that-trust-shall-be-as-mount-zion-the-kingdom-that-cannot-be-moved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Elohim (God) is in the midst of her; she shall not be moved* (Psalm 46:5) — the Presence in her midst is why Zion *cannot be removed* (Psalm 125:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=1
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-they-that-trust-shall-be-as-mount-zion-the-kingdom-that-cannot-be-moved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD B
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*A wall of fire round about, and... the glory in the midst of her* (Zechariah 2:5) — the encircling Yahuah of *round about his people* (Psalm 125:2).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=2
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-as-the-mountains-round-about-jerusalem-yahuah-round-about-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Underneath are the everlasting arms* (Deuteronomy 33:27) — Moses'' blessing, the same encirclement *round about his people from henceforth even for ever* (Psalm 125:2).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=2
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-as-the-mountains-round-about-jerusalem-yahuah-round-about-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*One nation... no more two nations* (Ezekiel 37:22) — the *people* Yahuah surrounds is the two-house whole, the two sticks made one (Psalm 125:2).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=2
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-as-the-mountains-round-about-jerusalem-yahuah-round-about-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — the guard: *for ever* (Psalm 125:2) means never cast off, never replaced.'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=2
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-as-the-mountains-round-about-jerusalem-yahuah-round-about-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD C
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The land shall be divided by lot: according to the names of the tribes* (Numbers 26:55) — the tribal inheritance is the *lot of the righteous* the rod may not rest upon (Psalm 125:3).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=3
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=26 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-rod-of-the-wicked-shall-not-rest-upon-the-lot-of-the-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Will not suffer you to be tempted above that ye are able* (1 Corinthians 10:13) — the held-back rod, measured *lest the righteous put forth their hands unto iniquity* (Psalm 125:3).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=3
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-rod-of-the-wicked-shall-not-rest-upon-the-lot-of-the-righteous'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD D
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6) — the two ways of Psalm 125:4-5.'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=4
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Depart from me, ye that work iniquity* (Matthew 7:23) — the crooked *led forth with the workers of iniquity* (Psalm 125:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=5
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim* (Galatians 6:16) — Paul''s benediction over the same gathered house, *peace shall be upon Yashar''el* (Psalm 125:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=5
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Peace upon Yashar''el (Israel)* (Psalm 128:6) — the Ascents echo the same shalom three psalms on (Psalm 125:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=5
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=128 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Elohim hath not cast away his people which he foreknew* (Romans 11:2) — the guard: the Israel of the blessing is kept, never exchanged (Psalm 125:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps125_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=125 AND sv.verse_number=5
  JOIN _s302_ps125_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-125-the-two-ways-but-peace-shall-be-upon-yasharel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
