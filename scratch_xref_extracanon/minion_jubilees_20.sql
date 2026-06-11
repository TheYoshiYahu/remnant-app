-- ----- fragment: minion_jubilees_20.sql (session251 jubilees 20) -----
-- Source anchor: jubilees/jubilees ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju20 (view _session251_ju20_lookup). Sort band base 53475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-20-command-the-children-the-way
  ('jubilees', 'jubilees', 20, 2, 'canon', 'genesis', 18, 19, 'free', E'Genesis 18:19 — *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment; that Yahuah (LORD) may bring upon Abraham that which he hath spoken of him.* Jubilees 20:2 dramatizes the very commanding Yahuah foreknew — Abraham charging his sons to do judgment and righteousness.'),
  ('jubilees', 'jubilees', 20, 2, 'canon', 'deuteronomy', 6, 7, 'free', E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Abraham''s gathering of sons and grandsons to keep the way (Jubilees 20:1-2) is the patriarchal seed of the Shema''s command to teach the children.'),
  -- thread: jubilees-20-circumcision-the-covenant
  ('jubilees', 'jubilees', 20, 3, 'canon', 'genesis', 17, 10, 'free', E'Genesis 17:10 — *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* Jubilees 20:3 has Abraham hand this very covenant down as a charge to his sons and grandsons.'),
  ('jubilees', 'jubilees', 20, 3, 'canon', 'genesis', 17, 13, 'free', E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* The covenant Abraham commands in Jubilees 20:3 is everlasting flesh-cut, not a transient ordinance.'),
  -- thread: jubilees-20-flee-fornication-no-canaanite-wives
  ('jubilees', 'jubilees', 20, 4, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* Abraham''s ban on Canaanite wives (Jubilees 20:4) is the same wall around the seed the Torah builds at the conquest.'),
  ('jubilees', 'jubilees', 20, 4, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The seed kept from Canaan in Jubilees 20:4 is kept holy because it is the chosen, separated portion.'),
  ('jubilees', 'jubilees', 20, 3, 'canon', '2-corinthians', 6, 14, 'free', E'2 Corinthians 6:14 — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* Abraham''s renouncing of all uncleanness and forbidden union (Jubilees 20:3) is the same separation the renewed covenant commands.'),
  ('jubilees', 'jubilees', 20, 4, 'jubilees', 'jubilees', 22, 20, 'extras', E'Jubilees 22:20 — *Be you ware, my son Jacob, of taking a wife from any seed of the daughters of Canaan; For all his seed is to be rooted out of the earth.* Abraham repeats to Jacob the very ban he lays on all his sons here in Jubilees 20:4 — the seed kept separate runs through the whole book.'),
  -- thread: jubilees-20-giants-and-sodom-judged
  ('jubilees', 'jubilees', 20, 5, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* This is the judgment of the Sodomites Abraham rehearses to his sons as a warning in Jubilees 20:5.'),
  ('jubilees', 'jubilees', 20, 5, 'canon', 'jude', 1, 7, 'free', E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The NT reads Sodom precisely as Jubilees 20:5 does — fornication and uncleanness judged, set as an example to flee.'),
  -- thread: jubilees-20-no-idols-they-are-vanity
  ('jubilees', 'jubilees', 20, 8, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth.* Abraham''s charge against molten and graven gods in Jubilees 20:8 is the second commandment spoken before Sinai was given.'),
  ('jubilees', 'jubilees', 20, 8, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* Echoes Abraham''s verdict in Jubilees 20:8 that idols are work of men''s hands with no spirit in them.'),
  ('jubilees', 'jubilees', 20, 8, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The psalm seals Abraham''s warning in Jubilees 20:8 that all who trust in idols trust in nothing.'),
  ('jubilees', 'jubilees', 20, 8, 'canon', 'jeremiah', 10, 15, 'free', E'Jeremiah 10:15 — *They are vanity, and the work of errors: in the time of their visitation they shall perish.* Jeremiah names the idols vanity in the same word Abraham uses in Jubilees 20:7-8.'),
  -- thread: jubilees-20-serve-the-most-high-blessing
  ('jubilees', 'jubilees', 20, 10, 'canon', 'genesis', 12, 2, 'free', E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.* Abraham''s word that his seed will be for a blessing on the earth (Jubilees 20:10) hands down the promise first spoken over himself.'),
  ('jubilees', 'jubilees', 20, 10, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The all-nations blessing of Jubilees 20:10 is the Abrahamic promise that the families of the earth are blessed in his seed.'),
  ('jubilees', 'jubilees', 20, 10, 'canon', 'genesis', 25, 6, 'free', E'Genesis 25:6 — *But unto the sons of the concubines, which Abraham had, Abraham gave gifts, and sent them away from Isaac his son, while he yet lived, eastward, unto the east country.* Jubilees 20:10''s sending of Ishmael and Keturah''s sons away with gifts, the inheritance reserved to Isaac, is the same event Genesis records.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-20-command-the-children-the-way',
       E'Abraham commands his children to keep the way of Yahuah',
       E'Abraham gathers the whole house — *And in the forty-second jubilee, in the first year of the seventh week, Abraham called Ishmael, and his twelve sons, and Isaac and his two sons, and the six sons of Keturah, and their sons* (Jubilees 20:1) — and lays on them the charge: *And he commanded them that they should observe the way of Yahuah (God); that they should work righteousness, and love each his neighbour... as to do judgment and righteousness on the earth* (Jubilees 20:2). This is no late invention. Yahuah Himself named this the very reason He chose Abraham: *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment; that Yahuah (LORD) may bring upon Abraham that which he hath spoken of him* (Genesis 18:19). The same charge is the heartbeat of the Shema, handed down the generations: *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up* (Deuteronomy 6:7). The way is taught father to son — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53475
  FROM _session251_ju20_lookup sv, _session251_ju20_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=20 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-20-circumcision-the-covenant',
       E'Circumcise your sons — the everlasting covenant',
       E'Abraham''s charge fixes on the sign cut into the flesh: *That they should circumcise their sons, according to the covenant which He had made with them, and not deviate to the right hand or the left of all the paths which Yahuah (God) had commanded us* (Jubilees 20:3). This is the covenant of Genesis 17, spoken to Abraham himself: *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised* (Genesis 17:10), and called *an everlasting covenant* in the flesh: *and my covenant shall be in your flesh for an everlasting covenant* (Genesis 17:13). The not-turning-aside is the Torah''s own refrain for the way: walk it without swerving right or left. Jubilees grounds the sign in the patriarch before Sinai — it ain''t new, and it is not abolished.',
       sv.verse_id, ev.verse_id, 'extras', 53478
  FROM _session251_ju20_lookup sv, _session251_ju20_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=20 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-20-flee-fornication-no-canaanite-wives',
       E'Flee fornication and uncleanness — no wives from Canaan',
       E'The charge turns sharp against mixing: *and that we should keep ourselves from all fornication and uncleanness, and renounce from amongst us all fornication and uncleanness* (Jubilees 20:3), and then names the line that may not be crossed: *and let them not take to themselves wives from the daughters of Canaan; for the seed of Canaan will be rooted out of the land* (Jubilees 20:4). This is the Torah''s own fence around the seed: *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) — because *thou art an holy people unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 7:6). The same wall stands in the renewed covenant: *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness?* (2 Corinthians 6:14). Abraham himself repeats it to Jacob in the next breath of the book — *Be you ware, my son Jacob, of taking a wife from any seed of the daughters of Canaan; For all his seed is to be rooted out of the earth* (Jubilees 22:20). The seed is kept holy — separation, not racism; the line is the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 53481
  FROM _session251_ju20_lookup sv, _session251_ju20_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=20 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-20-giants-and-sodom-judged',
       E'The judgment of the giants and the Sodomites',
       E'Abraham sets the warning on the page of history: *And he told them of the judgment of the giants, and the judgment of the Sodomites, how they had been judged on account of their wickedness, and had died on account of their fornication, and uncleanness, and mutual corruption through fornication* (Jubilees 20:5). The Sodom judgment is the fire of Genesis: *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven* (Genesis 19:24). The apostolic word reads Sodom exactly as Jubilees does — a standing example of fornication judged: *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire* (Jude 1:7). And the warning lands where Abraham aims it: *And you become accursed like Sodom, And all your remnant as the sons of Gomorrah* (Jubilees 20:5). The same fates, the same fence.',
       sv.verse_id, ev.verse_id, 'extras', 53484
  FROM _session251_ju20_lookup sv, _session251_ju20_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=20 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-20-no-idols-they-are-vanity',
       E'Make no graven gods — they are vanity, no spirit in them',
       E'Abraham forbids the idols of the nations: *And walk not after their idols, and after their uncleannesses, And make not for yourselves molten or graven gods; For they are vanity, And there is no spirit in them; For they are work of (men''s) hands, And all who trust in them, trust in nothing* (Jubilees 20:7-8). This is the second word of Sinai spoken in the mouth of the patriarch before Sinai: *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above* (Exodus 20:4). The psalm answers in Abraham''s very words: *Their idols are silver and gold, the work of men''s hands* (Psalm 115:4), *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). And Jeremiah preaches the same vanity to the house of Israel: *They are vanity, and the work of errors: in the time of their visitation they shall perish* (Jeremiah 10:15). Against the idols Abraham sets the one true worship — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53487
  FROM _session251_ju20_lookup sv, _session251_ju20_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=20 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-20-serve-the-most-high-blessing',
       E'Serve the Most High — and be a blessing to all nations',
       E'Against the idols Abraham sets the true worship and its reward: *But serve you the El Elyon (Most High) Elohim (God), and worship Him continually... And bless your bread and your water, And bless the fruit of your womb and the fruit of your land* (Jubilees 20:9) — the very blessings of the covenant land. Then the promise widens to the world: *And you will be for a blessing on the earth, And all nations of the earth will desire you, And bless your sons in my name, That they may be blessed as I am* (Jubilees 20:10). This is the Abrahamic promise of Genesis: *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2), *and in thee shall all families of the earth be blessed* (Genesis 12:3). The seed kept separate is not kept selfish — it is kept as the channel of blessing to all nations. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53490
  FROM _session251_ju20_lookup sv, _session251_ju20_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=20 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-20-command-the-children-the-way
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:19 — *For I know him, that he will command his children and his household after him, and they shall keep the way of Yahuah (LORD), to do justice and judgment; that Yahuah (LORD) may bring upon Abraham that which he hath spoken of him.* Jubilees 20:2 dramatizes the very commanding Yahuah foreknew — Abraham charging his sons to do judgment and righteousness.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-command-the-children-the-way'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house, and when thou walkest by the way, and when thou liest down, and when thou risest up.* Abraham''s gathering of sons and grandsons to keep the way (Jubilees 20:1-2) is the patriarchal seed of the Shema''s command to teach the children.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-command-the-children-the-way'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-20-circumcision-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:10 — *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* Jubilees 20:3 has Abraham hand this very covenant down as a charge to his sons and grandsons.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-circumcision-the-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* The covenant Abraham commands in Jubilees 20:3 is everlasting flesh-cut, not a transient ordinance.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-circumcision-the-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-20-flee-fornication-no-canaanite-wives
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* Abraham''s ban on Canaanite wives (Jubilees 20:4) is the same wall around the seed the Torah builds at the conquest.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-flee-fornication-no-canaanite-wives'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The seed kept from Canaan in Jubilees 20:4 is kept holy because it is the chosen, separated portion.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-flee-fornication-no-canaanite-wives'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 6:14 — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* Abraham''s renouncing of all uncleanness and forbidden union (Jubilees 20:3) is the same separation the renewed covenant commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-flee-fornication-no-canaanite-wives'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 22:20 — *Be you ware, my son Jacob, of taking a wife from any seed of the daughters of Canaan; For all his seed is to be rooted out of the earth.* Abraham repeats to Jacob the very ban he lays on all his sons here in Jubilees 20:4 — the seed kept separate runs through the whole book.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-flee-fornication-no-canaanite-wives'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=22 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-20-giants-and-sodom-judged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven.* This is the judgment of the Sodomites Abraham rehearses to his sons as a warning in Jubilees 20:5.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-giants-and-sodom-judged'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:7 — *Even as Sodom and Gomorrha, and the cities about them in like manner, giving themselves over to fornication, and going after strange flesh, are set forth for an example, suffering the vengeance of eternal fire.* The NT reads Sodom precisely as Jubilees 20:5 does — fornication and uncleanness judged, set as an example to flee.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-giants-and-sodom-judged'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-20-no-idols-they-are-vanity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth.* Abraham''s charge against molten and graven gods in Jubilees 20:8 is the second commandment spoken before Sinai was given.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-no-idols-they-are-vanity'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* Echoes Abraham''s verdict in Jubilees 20:8 that idols are work of men''s hands with no spirit in them.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-no-idols-they-are-vanity'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The psalm seals Abraham''s warning in Jubilees 20:8 that all who trust in idols trust in nothing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-no-idols-they-are-vanity'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:15 — *They are vanity, and the work of errors: in the time of their visitation they shall perish.* Jeremiah names the idols vanity in the same word Abraham uses in Jubilees 20:7-8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-no-idols-they-are-vanity'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-20-serve-the-most-high-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.* Abraham''s word that his seed will be for a blessing on the earth (Jubilees 20:10) hands down the promise first spoken over himself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-serve-the-most-high-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The all-nations blessing of Jubilees 20:10 is the Abrahamic promise that the families of the earth are blessed in his seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-serve-the-most-high-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 25:6 — *But unto the sons of the concubines, which Abraham had, Abraham gave gifts, and sent them away from Isaac his son, while he yet lived, eastward, unto the east country.* Jubilees 20:10''s sending of Ishmael and Keturah''s sons away with gifts, the inheritance reserved to Isaac, is the same event Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju20_lookup sv, _session251_ju20_lookup tv
 WHERE t.slug='jubilees-20-serve-the-most-high-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

