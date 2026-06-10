-- ----- fragment: minion_romans_11.sql (S219 Romans 11) -----
-- =====================================================================
-- S219 minion — ROMANS 11 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 11.  Tag: r11 (temp view _s219_r11_lookup).  Sort band: 6250-6274, step 3.
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #7 and #11 — the single highest voice-risk chapter in the NT):
-- *Hath Elohim (God) cast away his people? Elohim (God) forbid* (11:1) is the chapter's thesis —
-- Yashar'el (Israel) is NOT cast away. The olive tree is Yashar'el's own covenant tree, the tree
-- Yahuah named *A green olive tree, fair, and of goodly fruit* (Jeremiah 11:16). The natural
-- branches are the covenant lineage of the fathers — the line carried through Avraham, Yitschaq,
-- and Ya'aqov into the twelve tribes — broken off in unbelief, asleep, awaiting the resurrection.
-- The hardening is *in part* and *until* — *blindness in part is happened to Yashar'el (Israel),
-- until the fulness of the Gentiles be come in* (11:25): not total, not final. *And so all
-- Yashar'el (Israel) shall be saved* (11:26), as it is written = Isaiah 59:20-21. The wild-olive
-- branches are US — the living descendants of the broken-off, the scattered/dispersed of
-- Yashar'el being gathered home and *graffed contrary to nature into a good olive tree* (11:24),
-- *grafted into their own olive tree* — RESTORATION of Yashar'el's own, never a replacement
-- people, never outsiders supplanting Yashar'el. *The gifts and calling of Elohim (God) are
-- without repentance* (11:29) — irrevocable. The grafted are warned NOT to boast against the
-- natural branches (11:18-21) — Paul's own anti-supersessionist guardrail.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-5    cast away? / the reserved remnant   Tanakh: 1 Kings 19:10, 19:14, 19:18 (the 7000); Jeremiah 31:37 (never cast off)  Extras: none warranted  NT: none added (Elias intercession carried by 1 Kings)
--   v.6      grace not of works                  Tanakh: none warranted  Extras: none warranted  NT: none warranted (carried in remnant thread)
--   v.7-10   spirit of slumber / blinded in part  Tanakh: Isaiah 29:10, Deuteronomy 29:4 (the slumber); Psalm 69:22-23 (David's table-snare)  Extras: none warranted  NT: none added (Paul cites the Tanakh directly)
--   v.11-15  through their fall / receiving = life Tanakh: Jeremiah 31:10 (he that scattered will gather)  Extras: Tobit 13:5 (gather us out of all nations)  NT: none added
--   v.16-24  the olive tree / graffed into own    Tanakh: Jeremiah 11:16 (the green olive tree = Yashar'el); Jeremiah 31:18-20 (Ephraim grafted back)  Extras: none warranted  NT: none added (Romans-internal; root carried by Jeremiah)
--   v.25-27  in part / until the fulness / all saved Tanakh: Isaiah 59:20, 59:21 (Paul's citation); Jeremiah 31:33, 31:34 (the covenant, sins taken away)  Extras: none warranted  NT: none added
--   v.28-32  beloved for the fathers' sakes / mercy Tanakh: Jeremiah 31:3 (everlasting love); Jeremiah 31:20 (Ephraim my dear son)  Extras: Tobit 13:5 (scourge and have mercy again)  NT: none added
--   v.33-36  O the depth / the unsearchable        Tanakh: Isaiah 40:13 (who hath known the mind); Job 41:11 (who hath first given)  Extras: none warranted  NT: none added (Paul cites the Tanakh directly)
--
-- THREADS (slug -> target libraries):
--   6250 romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant        (Tanakh)
--   6253 romans-11-the-spirit-of-slumber-blindness-in-part-not-final                          (Tanakh)
--   6256 romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead                 (Tanakh + Extras)
--   6259 romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement              (Tanakh)
--   6262 romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved       (Tanakh)
--   6265 romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes     (Tanakh + Extras)
--   6268 romans-11-o-the-depth-how-unsearchable-the-mind-of-yahuah                            (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s219_r11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant
  ('canon', 'romans', 11, 2, 'canon', '1-kings', 19, 10, 'free', E'*And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: for the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* (1 Kings 19:10). Paul asks *Hath Elohim (God) cast away his people?* and answers *Elohim (God) forbid* (Romans 11:1), and to prove it he reaches for Elias, who *maketh intercession to Elohim (God) against Yashar''el (Israel)* (Romans 11:2). Elijah thought himself the last man standing — *I, even I only, am left* — the very cry Paul quotes to show how wrong that despair was. The faithful are never as few as they look.'),
  ('canon', 'romans', 11, 3, 'canon', '1-kings', 19, 14, 'free', E'*And he said, I have been very jealous for Yahuah Elohim (the LORD God) of hosts: because the children of Yashar''el (Israel) have forsaken thy covenant, thrown down thine altars, and slain thy prophets with the sword; and I, even I only, am left; and they seek my life, to take it away.* (1 Kings 19:14). Paul puts Elijah''s words in his mouth almost verbatim: *Yahuah (Lord), they have killed thy prophets, and digged down thine altars; and I am left alone, and they seek my life* (Romans 11:3). The prophet was certain the covenant people had collapsed to one. The answer Yahuah gives him is the answer to the whole chapter''s fear.'),
  ('canon', 'romans', 11, 4, 'canon', '1-kings', 19, 18, 'free', E'*Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him.* (1 Kings 19:18). Paul quotes the answer: *I have reserved to myself seven thousand men, who have not bowed the knee to the image of Baal* (Romans 11:4). Where Elijah saw himself alone, Yahuah had *left me seven thousand* — a hidden, reserved remnant. *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The remnant is always preserved; the people are never cast away.'),
  ('canon', 'romans', 11, 1, 'canon', 'jeremiah', 31, 37, 'free', E'*Thus saith Yahuah (LORD); If heaven above can be measured, and the foundations of the earth searched out beneath, I will also cast off all the seed of Yashar''el (Israel) for all that they have done, saith Yahuah (LORD).* (Jeremiah 31:37). When Paul asks *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1), he stands on the oath Yahuah swore through Jeremiah: only if the heavens could be measured and the foundations of the earth searched out would he cast off the seed of Yashar''el — which is to say, never. The casting-away is impossible by Yahuah''s own word; the seed of Yashar''el cannot be undone.'),
  -- thread: romans-11-the-spirit-of-slumber-blindness-in-part-not-final
  ('canon', 'romans', 11, 8, 'canon', 'isaiah', 29, 10, 'free', E'*For Yahuah (LORD) hath poured out upon you the spirit of deep sleep, and hath closed your eyes: the prophets and your rulers, the seers hath he covered.* (Isaiah 29:10). Paul writes that *Elohim (God) hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear* (Romans 11:8). The phrase is Isaiah''s *spirit of deep sleep* and *closed your eyes.* But the prophet himself bounds it: *in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity* (Isaiah 29:18). The slumber is real, but it is a slumber from which the deaf and blind are promised to wake.'),
  ('canon', 'romans', 11, 8, 'canon', 'deuteronomy', 29, 4, 'free', E'*Yet Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day.* (Deuteronomy 29:4). Paul closes his citation with the very words *unto this day* (Romans 11:8), the close of Moses'' line: *eyes to see, and ears to hear, unto this day.* Moses speaks it inside the covenant — *that thou shouldest enter into covenant with Yahuah Elohayka (the LORD thy God)* (Deuteronomy 29:12) — to a people still wholly his. The unseeing is a condition under the covenant, not an expulsion from it; *unto this day* names a present blindness, not a closed door.'),
  ('canon', 'romans', 11, 9, 'canon', 'psalms', 69, 22, 'free', E'*Let their table become a snare before them: and that which should have been for their welfare, let it become a trap.* (Psalm 69:22). *And David saith, Let their table be made a snare, and a trap, and a stumblingblock, and a recompence unto them* (Romans 11:9). Paul reaches for David''s psalm, where the very provision meant for *welfare* becomes a snare to those who reject the One they should have received. The table-turned-snare is judgment on the stumbling — but a stumbling, Paul has just said, that is not a fall: *Have they stumbled that they should fall? Elohim (God) forbid* (Romans 11:11).'),
  ('canon', 'romans', 11, 10, 'canon', 'psalms', 69, 23, 'free', E'*Let their eyes be darkened, that they see not; and make their loins continually to shake.* (Psalm 69:23). *Let their eyes be darkened, that they may not see, and bow down their back alway* (Romans 11:10). Paul carries David''s line straight across: darkened eyes, a bowed-down back. It is the same darkening as the *spirit of slumber* — a judicial blindness on those who would not see. Yet Paul frames the whole of it as *in part* (Romans 11:25): a darkening that is partial and bounded, set within a chapter whose thesis is that the people are not cast away.'),
  -- thread: romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead
  ('canon', 'romans', 11, 15, 'canon', 'jeremiah', 31, 10, 'free', E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock.* (Jeremiah 31:10). Paul asks, *if the casting away of them be the reconciling of the world, what shall the receiving of them be, but life from the dead?* (Romans 11:15). The receiving is the gathering Jeremiah proclaimed to the very nations and isles afar off: *He that scattered Yashar''el will gather him.* The same Yahuah who scattered is the One who gathers; the receiving of the scattered home is nothing less than life from the dead.'),
  ('canon', 'romans', 11, 12, 'canon', 'jeremiah', 31, 8, 'free', E'*Behold, I will bring them from the north country, and gather them from the coasts of the earth, and with them the blind and the lame, the woman with child and her that travaileth with child together: a great company shall return thither.* (Jeremiah 31:8). Paul reaches past the present *diminishing of them* to *how much more their fulness?* (Romans 11:12). The fulness is the *great company* Jeremiah saw returning — brought from the north country, gathered from the coasts of the earth, the blind and the lame among them. The diminishing is not the end of the story; the prophet already saw the multitude coming home.'),
  ('canon', 'romans', 11, 15, 'apocrypha', 'tobit', 13, 5, 'extras', E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5). When Paul names *the receiving of them … life from the dead* (Romans 11:15), Tobit''s prayer holds the whole shape of it: Yahuah will *scourge us for our iniquities, and will have mercy again, and will gather us out of all nations.* The scattering and the gathering are one motion of one Father — the discipline is never abandonment, and the regathering of the dispersed of Yashar''el out of all nations is the mercy waiting on the far side of the scourge.'),
  -- thread: romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement  (CENTERPIECE)
  ('canon', 'romans', 11, 16, 'canon', 'jeremiah', 11, 16, 'free', E'*Yahuah (LORD) called thy name, A green olive tree, fair, and of goodly fruit: with the noise of a great tumult he hath kindled fire upon it, and the branches of it are broken.* (Jeremiah 11:16). When Paul says *if the root be holy, so are the branches* (Romans 11:16) and builds the whole figure of the olive tree, he is not inventing a metaphor — he is reaching for the tree Yahuah himself planted and named. *Yahuah called thy name, A green olive tree* — the name is Yashar''el''s. *The branches of it are broken* is the very breaking Paul describes. The olive tree is Yashar''el''s own covenant tree; the branches broken from it are Yashar''el''s own.'),
  ('canon', 'romans', 11, 24, 'canon', 'jeremiah', 31, 18, 'free', E'*I have surely heard Ephraim bemoaning himself thus; Thou hast chastised me, and I was chastised, as a bullock unaccustomed to the yoke: turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God).* (Jeremiah 31:18). Paul says the wild branches are *graffed contrary to nature into a good olive tree* and asks *how much more shall these, which be the natural branches, be graffed into their own olive tree?* (Romans 11:24). Jeremiah already heard the scattered house of the north — Ephraim — bemoaning himself and turning home: *turn thou me, and I shall be turned.* The grafting-in is Ephraim''s homecoming to the tree that was always his; it is restoration of Yashar''el''s own, not the admission of a stranger people.'),
  ('canon', 'romans', 11, 24, 'canon', 'jeremiah', 31, 20, 'free', E'*Is Ephraim my dear son? is he a pleasant child? for since I spake against him, I do earnestly remember him still: therefore my bowels are troubled for him; I will surely have mercy upon him, saith Yahuah (LORD).* (Jeremiah 31:20). Paul''s *graffed into their own olive tree* (Romans 11:24) is the mercy Yahuah swore over Ephraim — the broken-off, scattered house — *I will surely have mercy upon him.* Ephraim is no outsider grafted in for the first time; he is the *dear son,* the *pleasant child* Yahuah never stopped remembering. The grafting is the Father receiving his own son home to his own tree.'),
  -- thread: romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved
  ('canon', 'romans', 11, 26, 'canon', 'isaiah', 59, 20, 'free', E'*And the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob, saith Yahuah (LORD).* (Isaiah 59:20). Paul writes *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26) — and the writing he means is this. The Deliverer comes *to Zion,* to *them that turn from transgression in Jacob.* The salvation of all Yashar''el is not a substitution of another people for Jacob; it is the Redeemer coming to Jacob himself, to turn away his ungodliness.'),
  ('canon', 'romans', 11, 27, 'canon', 'isaiah', 59, 21, 'free', E'*As for me, this is my covenant with them, saith Yahuah (LORD); My spirit that is upon thee, and my words which I have put in thy mouth, shall not depart out of thy mouth, nor out of the mouth of thy seed, nor out of the mouth of thy seed''s seed, saith Yahuah (LORD), from henceforth and for ever.* (Isaiah 59:21). Paul continues the citation: *For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). The covenant Isaiah names is an everlasting one — the Spirit and the words that *shall not depart … from henceforth and for ever* — passed down through *thy seed, and … thy seed''s seed.* It is a covenant kept with a bloodline through the generations, not transferred away from it.'),
  ('canon', 'romans', 11, 27, 'canon', 'jeremiah', 31, 33, 'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). *This is my covenant unto them, when I shall take away their sins* (Romans 11:27). The covenant by which all Yashar''el is saved is the one Jeremiah foretold — Yahuah''s law written *in their inward parts … in their hearts.* The new covenant is not the law set aside but the law internalized in the house of Yashar''el; the saving and the Torah-on-the-heart are one work.'),
  ('canon', 'romans', 11, 27, 'canon', 'jeremiah', 31, 34, 'free', E'*And they shall teach no more every man his neighbour, and every man his brother, saying, Know Yahuah (LORD): for they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more.* (Jeremiah 31:34). Paul''s *when I shall take away their sins* (Romans 11:27) is Jeremiah''s *I will forgive their iniquity, and I will remember their sin no more.* The taking-away of sins that crowns the salvation of all Yashar''el is the very pardon the prophet promised the house — sins remembered no more, the whole house brought to know Yahuah from the least to the greatest.'),
  -- thread: romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes
  ('canon', 'romans', 11, 28, 'canon', 'jeremiah', 31, 3, 'free', E'*Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee.* (Jeremiah 31:3). Paul says that *as touching the election, they are beloved for the fathers'' sakes* (Romans 11:28), *for the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). The being-beloved rests on the everlasting love Jeremiah heard Yahuah declare — *I have loved thee with an everlasting love.* A love that is everlasting cannot be repented of or withdrawn; the calling stands because the love that made it never changes.'),
  ('canon', 'romans', 11, 28, 'canon', 'jeremiah', 31, 20, 'free', E'*Is Ephraim my dear son? is he a pleasant child? for since I spake against him, I do earnestly remember him still: therefore my bowels are troubled for him; I will surely have mercy upon him, saith Yahuah (LORD).* (Jeremiah 31:20). *They are beloved for the fathers'' sakes* (Romans 11:28) is the very disposition Yahuah confessed over the scattered house: even *since I spake against him, I do earnestly remember him still.* The judgment did not end the affection. Ephraim under chastisement is still the *dear son,* still earnestly remembered — the beloved-for-the-fathers''-sakes that Paul names, the love that survives the breaking.'),
  ('canon', 'romans', 11, 30, 'apocrypha', 'tobit', 13, 5, 'extras', E'*And he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us.* (Tobit 13:5). Paul writes that *Elohim (God) hath concluded them all in unbelief, that he might have mercy upon all* (Romans 11:32) — first the unbelief, then the mercy, *that through your mercy they also may obtain mercy* (Romans 11:31). Tobit''s prayer carries the same rhythm of one Father: he will *scourge us for our iniquities, and will have mercy again.* The concluding under judgment is never the last word; mercy is the appointed end, and the gathering out of all nations is mercy made visible.'),
  -- thread: romans-11-o-the-depth-how-unsearchable-the-mind-of-yahuah
  ('canon', 'romans', 11, 34, 'canon', 'isaiah', 40, 13, 'free', E'*Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* (Isaiah 40:13). *For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34). Paul quotes Isaiah word for word at the close of the olive-tree mystery. The prophet asked it of the One who measures the waters in his hand and gathers the lambs in his bosom; Paul asks it of the One whose hidden purpose has just reserved a remnant, bounded the blindness, and sworn to save all Yashar''el. No man counsels Yahuah; the depth of his mercy is past finding out.'),
  ('canon', 'romans', 11, 35, 'canon', 'job', 41, 11, 'free', E'*Who hath prevented me, that I should repay him? whatsoever is under the whole heaven is mine.* (Job 41:11). *Or who hath first given to him, and it shall be recompensed unto him again?* (Romans 11:35). Paul reaches for the word Yahuah spoke out of the whirlwind: none has *prevented me, that I should repay him,* for *whatsoever is under the whole heaven is mine.* No creature puts Yahuah in his debt. The mercy that gathers Yashar''el home is wholly his free gift, owed to no one — *for of him, and through him, and to him, are all things* (Romans 11:36).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant',
       E'Hath Elohim (God) cast away his people? Elohim (God) forbid — the reserved remnant',
       E'The whole chapter turns on one question and one answer: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Paul himself, seed of Abraham, is the living proof that the people are not cast away — and to seal it he reaches for Elias. The prophet was certain the covenant people had collapsed to a single man: *Yahuah (Lord), they have killed thy prophets, and digged down thine altars; and I am left alone, and they seek my life* (Romans 11:3), the very words of *I, even I only, am left* (1 Kings 19:10, 19:14). But the answer Yahuah gave him overturns the despair: *I have reserved to myself seven thousand men, who have not bowed the knee to the image of Baal* (Romans 11:4) — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal* (1 Kings 19:18). Where Elijah saw himself alone, Yahuah had kept a hidden remnant of thousands. *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The remnant is always preserved; the people are never cast away. And the impossibility of the casting-away was sworn long before: *If heaven above can be measured, and the foundations of the earth searched out beneath, I will also cast off all the seed of Yashar''el (Israel)* (Jeremiah 31:37) — which is to say, never. The seed of Yashar''el cannot be undone.',
       sv.verse_id, ev.verse_id, 'free', 6250
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-the-spirit-of-slumber-blindness-in-part-not-final',
       E'The spirit of slumber — a blindness in part, not final',
       E'Paul explains the present unbelief of part of Yashar''el (Israel) not as a casting-off but as a slumber, and he proves it from the prophets: *Yashar''el (Israel) hath not obtained that which he seeketh for; but the election hath obtained it, and the rest were blinded* (Romans 11:7), *Elohim (God) hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear; unto this day* (Romans 11:8). The phrase is Isaiah''s: *Yahuah (LORD) hath poured out upon you the spirit of deep sleep, and hath closed your eyes* (Isaiah 29:10) — yet the same prophet bounds the sleep with a promise, *in that day shall the deaf hear the words of the book, and the eyes of the blind shall see out of obscurity* (Isaiah 29:18). And the close of Paul''s citation, *unto this day,* is Moses'' own word spoken inside the covenant: *Yet Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deuteronomy 29:4) — a present blindness in a people still wholly his, not an expulsion. David adds the judgment on those who would not see: *Let their table be made a snare, and a trap, and a stumblingblock* (Romans 11:9), *let their eyes be darkened, that they may not see* (Romans 11:10), echoing *let their table become a snare before them* (Psalm 69:22) and *let their eyes be darkened, that they see not* (Psalm 69:23). The provision meant for welfare becomes a snare to those who reject the One they should have received. Yet Paul names the whole of it *in part* (Romans 11:25): real, but partial, bounded, and not the fall it seems — *Have they stumbled that they should fall? Elohim (God) forbid* (Romans 11:11).',
       sv.verse_id, ev.verse_id, 'free', 6253
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead',
       E'Through their fall — the receiving of them, life from the dead',
       E'Paul will not let the stumble be read as a fall: *Have they stumbled that they should fall? Elohim (God) forbid: but rather through their fall salvation is come unto the Gentiles, for to provoke them to jealousy* (Romans 11:11). The present *diminishing* is not the end; he presses past it: *if the fall of them be the riches of the world, and the diminishing of them the riches of the Gentiles; how much more their fulness?* (Romans 11:12). That fulness is the homecoming Jeremiah saw: *Behold, I will bring them from the north country, and gather them from the coasts of the earth … a great company shall return thither* (Jeremiah 31:8). And the climax — *if the casting away of them be the reconciling of the world, what shall the receiving of them be, but life from the dead?* (Romans 11:15) — is the gathering Jeremiah proclaimed to the very nations: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The same Yahuah who scattered is the One who gathers. Tobit''s prayer holds the whole shape of it in one breath: he will *scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). The scattering and the gathering are one motion of one Father — the discipline never abandonment, the regathering of the dispersed of Yashar''el out of all nations nothing less than life from the dead.',
       sv.verse_id, ev.verse_id, 'extras', 6256
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement',
       E'Graffed into their own olive tree — restoration, not replacement',
       E'This is the heart of the chapter, and it must be read as the figure Paul actually builds. *If the firstfruit be holy, the lump is also holy: and if the root be holy, so are the branches* (Romans 11:16). The tree is no invented metaphor — it is the tree Yahuah himself planted and named: *Yahuah (LORD) called thy name, A green olive tree, fair, and of goodly fruit: with the noise of a great tumult he hath kindled fire upon it, and the branches of it are broken* (Jeremiah 11:16). The name is Yashar''el''s (Israel''s); the olive tree is Yashar''el''s own covenant tree, rooted in the fathers. The branches broken from it are Yashar''el''s own, broken off in unbelief — the covenant lineage carried through Avraham, Yitschaq, and Ya''aqov that fell when the houses fell. Then comes the warning to the grafted, the guardrail Paul himself builds against every supersession: *And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree; Boast not against the branches. But if thou boast, thou bearest not the root, but the root thee* (Romans 11:17-18). *Because of unbelief they were broken off, and thou standest by faith. Be not highminded, but fear: For if Elohim (God) spared not the natural branches, take heed lest he also spare not thee* (Romans 11:20-21). The wild branches are not a new people supplanting Yashar''el; they are the living descendants of the broken-off, the scattered seed grown wild among the nations, and they are warned never to boast against the natural branches whose root bears them. And the destination of the whole figure is restoration: *For if thou wert cut out of the olive tree which is wild by nature, and wert graffed contrary to nature into a good olive tree: how much more shall these, which be the natural branches, be graffed into their own olive tree?* (Romans 11:24). The natural branches — the fathers'' covenant line — Yahuah is able to graff *into their own olive tree.* Jeremiah already heard the scattered house turning home: *I have surely heard Ephraim bemoaning himself thus … turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (Jeremiah 31:18), and heard the Father''s answer over him, *Is Ephraim my dear son? is he a pleasant child? … I will surely have mercy upon him, saith Yahuah (LORD)* (Jeremiah 31:20). Ephraim is no stranger grafted in for the first time; he is the *dear son,* the *pleasant child* Yahuah never stopped remembering, coming home to the tree that was always his. The grafting is the Father receiving his own back to his own root — restoration of Yashar''el''s own, never a replacement people, never outsiders supplanting Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 6259
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved',
       E'Blindness in part, until the fulness — and so all Yashar''el (Israel) shall be saved',
       E'Paul names the mystery plainly so no one mistakes the slumber for a permanent fate: *I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The blindness is *in part* — not total — and it runs *until* a fixed term, not forever. And the term reached, the outcome is sworn: *And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). The writing he means is Isaiah''s: *And the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob, saith Yahuah (LORD)* (Isaiah 59:20). The Deliverer comes to Jacob himself — not a substitution of some other people for Jacob, but the Redeemer turning away the ungodliness of Jacob. The covenant behind it is everlasting and carried in a bloodline: *My spirit that is upon thee, and my words which I have put in thy mouth, shall not depart out of thy mouth, nor out of the mouth of thy seed, nor out of the mouth of thy seed''s seed … from henceforth and for ever* (Isaiah 59:21). And Paul''s closing line, *For this is my covenant unto them, when I shall take away their sins* (Romans 11:27), is Jeremiah''s new covenant with the house: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33), *for I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34). The saving of all Yashar''el is the Torah written on the heart of the house and the sins remembered no more — not the law set aside, but the covenant brought home to the people it was always made with.',
       sv.verse_id, ev.verse_id, 'free', 6262
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes',
       E'The gifts and calling without repentance — beloved for the fathers'' sakes',
       E'Paul grounds the certainty of the homecoming in the unchangeableness of Yahuah''s love: *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes. For the gifts and calling of Elohim (God) are without repentance* (Romans 11:28-29). The calling cannot be revoked because the love that made it cannot be revoked: *Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). A love that is everlasting cannot be repented of. And the being-beloved-for-the-fathers''-sakes is the very disposition Yahuah confessed over the scattered house under judgment: *for since I spake against him, I do earnestly remember him still … I will surely have mercy upon him, saith Yahuah (LORD)* (Jeremiah 31:20). The judgment never ended the affection. Paul then lays the whole purpose bare: *For as ye in times past have not believed Elohim (God), yet have now obtained mercy through their unbelief: Even so have these also now not believed, that through your mercy they also may obtain mercy* (Romans 11:30-31) — *For Elohim (God) hath concluded them all in unbelief, that he might have mercy upon all* (Romans 11:32). Tobit''s prayer carries the same rhythm of one Father: he will *scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). The concluding under judgment is never the last word; mercy is the appointed end, and the gathering of the dispersed out of all nations is that mercy made visible.',
       sv.verse_id, ev.verse_id, 'extras', 6265
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-11-o-the-depth-how-unsearchable-the-mind-of-yahuah',
       E'O the depth — how unsearchable the mind of Yahuah (LORD)',
       E'Having unfolded the whole mystery — a reserved remnant, a blindness in part and for a season, the scattered grafted home, all Yashar''el (Israel) saved — Paul can only worship: *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* (Romans 11:33). And he closes with two questions straight from the Tanakh. The first is Isaiah''s: *For who hath known the mind of Yahuah (Lord)? or who hath been his counsellor?* (Romans 11:34), echoing *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* (Isaiah 40:13) — asked of the One who measures the waters in his hand and gathers the lambs in his bosom. The second is Yahuah''s own word out of the whirlwind: *Or who hath first given to him, and it shall be recompensed unto him again?* (Romans 11:35), echoing *Who hath prevented me, that I should repay him? whatsoever is under the whole heaven is mine* (Job 41:11). No man counsels Yahuah; no creature puts him in its debt. The mercy that bounds the blindness and gathers Yashar''el home is wholly his free gift, owed to no one — *For of him, and through him, and to him, are all things: to whom be glory for ever. Amen* (Romans 11:36).',
       sv.verse_id, ev.verse_id, 'free', 6268
  FROM _s219_r11_lookup sv, _s219_r11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=11 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 19:10 — *I, even I only, am left; and they seek my life* Elijah''s despair, the cry Paul quotes to show the faithful are never as few as they look (Romans 11:2).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 19:14 — *I, even I only, am left; and they seek my life, to take it away* the prophet certain the people had collapsed to one, almost verbatim in Paul''s mouth (Romans 11:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 19:18 — *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal* the reserved remnant Elijah could not see, the answer to the chapter''s fear (Romans 11:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:37 — *If heaven above can be measured … I will also cast off all the seed of Yashar''el (Israel)* the casting-away sworn impossible; the seed of Yashar''el cannot be undone (Romans 11:1).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-hath-elohim-cast-away-his-people-elohim-forbid-the-reserved-remnant'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-11-the-spirit-of-slumber-blindness-in-part-not-final
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 29:10 — *Yahuah (LORD) hath poured out upon you the spirit of deep sleep, and hath closed your eyes* the slumber Paul names, bounded by the prophet''s promise that the blind shall yet see (Romans 11:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-spirit-of-slumber-blindness-in-part-not-final'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=29 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 29:4 — *eyes to see, and ears to hear, unto this day* Moses'' words spoken inside the covenant; a present blindness in a people still wholly his (Romans 11:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-spirit-of-slumber-blindness-in-part-not-final'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 69:22 — *Let their table become a snare before them … let it become a trap* David''s line Paul carries; the provision become judgment on the stumbling (Romans 11:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-spirit-of-slumber-blindness-in-part-not-final'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 69:23 — *Let their eyes be darkened, that they see not* the same darkening as the spirit of slumber, framed by Paul as in part and bounded (Romans 11:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-spirit-of-slumber-blindness-in-part-not-final'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:8 — *I will bring them from the north country, and gather them from the coasts of the earth … a great company shall return* the fulness Paul reaches for, the multitude already seen coming home (Romans 11:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:10 — *He that scattered Yashar''el (Israel) will gather him … as a shepherd doth his flock* the receiving of them, the same Yahuah who scattered now gathering (Romans 11:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:5 — *will have mercy again, and will gather us out of all nations, among whom he has scattered us* the scattering and gathering one motion of one Father; life from the dead made visible (Romans 11:15).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-through-their-fall-the-receiving-of-them-life-from-the-dead'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 11:16 — *Yahuah (LORD) called thy name, A green olive tree, fair, and of goodly fruit … the branches of it are broken* the olive tree is Yashar''el''s (Israel''s) own, named by Yahuah; the broken branches are Yashar''el''s own (Romans 11:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:18 — *I have surely heard Ephraim bemoaning himself … turn thou me, and I shall be turned* the scattered house turning home; the grafting-in is Ephraim''s homecoming to his own tree (Romans 11:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:20 — *Is Ephraim my dear son? … I will surely have mercy upon him* the broken-off is no stranger but the dear son never forgotten; grafted into his own root (Romans 11:24).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-graffed-into-their-own-olive-tree-restoration-not-replacement'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:20 — *the Redeemer shall come to Zion, and unto them that turn from transgression in Jacob* the writing Paul cites; the Deliverer comes to Jacob himself, not a substitute people (Romans 11:26).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 59:21 — *my words … shall not depart out of … thy seed, nor … thy seed''s seed … for ever* an everlasting covenant carried in a bloodline, never transferred away (Romans 11:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts … they shall be my people* the covenant by which all Yashar''el (Israel) is saved: Torah internalized, not set aside (Romans 11:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:34 — *I will forgive their iniquity, and I will remember their sin no more* Paul''s *when I shall take away their sins*; the pardon promised the whole house (Romans 11:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-blindness-in-part-until-the-fulness-and-so-all-israel-shall-be-saved'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:3 — *I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* a love everlasting cannot be repented of; the calling stands because the love stands (Romans 11:28).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:20 — *since I spake against him, I do earnestly remember him still … I will surely have mercy upon him* the judgment never ended the affection; beloved for the fathers'' sakes (Romans 11:28).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:5 — *he will scourge us … and will have mercy again, and will gather us out of all nations* the concluding under judgment never the last word; mercy the appointed end (Romans 11:30).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-the-gifts-and-calling-without-repentance-beloved-for-the-fathers-sakes'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-11-o-the-depth-how-unsearchable-the-mind-of-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:13 — *Who hath directed the Spirit of Yahuah (LORD), or being his counsellor hath taught him?* quoted word for word; no man counsels the One whose mercy is past finding out (Romans 11:34).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-o-the-depth-how-unsearchable-the-mind-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 41:11 — *Who hath prevented me, that I should repay him? whatsoever is under the whole heaven is mine* no creature puts Yahuah in its debt; the gathering mercy is wholly his free gift (Romans 11:35).'
  FROM cross_reference_threads t, cross_references x, _s219_r11_lookup sv, _s219_r11_lookup tv
 WHERE t.slug='romans-11-o-the-depth-how-unsearchable-the-mind-of-yahuah'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=11 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=41 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
