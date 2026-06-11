-- ----- fragment: minion_1enoch_10.sql (session250 1-enoch 10) -----
-- Source anchor: enoch/1-enoch ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en10 (view _session250_en10_lookup). Sort band base 50225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-10-noah-warned-flood
  ('enoch', '1-enoch', 10, 2, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The deluge Uriel announces to Noah in 1 Enoch 10:2 is this same resolve of Yahuah to blot out all flesh.'),
  ('enoch', '1-enoch', 10, 3, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* Enoch 10:3 names the reason Noah is told to escape — his seed is preserved through every generation, the elect remnant kept by grace.'),
  ('enoch', '1-enoch', 10, 3, 'canon', 'genesis', 7, 3, 'free', E'Genesis 7:3 — *Of fowls also of the air by sevens, the male and the female; to keep seed alive upon the face of all the earth.* The preserving of Noah''s seed for all generations (1 Enoch 10:3) is the keeping-seed-alive of the ark.'),
  ('enoch', '1-enoch', 10, 3, 'jubilees', 'jubilees', 5, 5, 'extras', E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* Jubilees carries the same Flood-intercession as Enoch 10, sparing Noah alone out of the corrupted earth.'),
  -- thread: 1-enoch-10-azazel-bound-scapegoat
  ('enoch', '1-enoch', 10, 4, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement scapegoat is sent into the same desert where Azazel is bound in 1 Enoch 10:4, the sin-bearer driven out alive.'),
  ('enoch', '1-enoch', 10, 8, 'canon', 'leviticus', 16, 22, 'free', E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* As all sin is ascribed to Azazel and he is sealed in the wilderness (1 Enoch 10:8), so the scapegoat bears all iniquities into a land uninhabited.'),
  ('enoch', '1-enoch', 10, 4, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the very binding of the Watchers Enoch 10:4-6 describes — chained in darkness until the great-day judgement.'),
  ('enoch', '1-enoch', 10, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter, like Enoch 10:6, holds the sinning angels in chains reserved for the fire of the great judgement.'),
  ('enoch', '1-enoch', 10, 5, 'canon', 'isaiah', 24, 22, 'free', E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host of the high ones shut in the pit until visited matches Azazel covered with rocks and darkness till the day of judgement (1 Enoch 10:5).'),
  -- thread: 1-enoch-10-giants-slay-each-other
  ('enoch', '1-enoch', 10, 9, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The children of the Watchers Gabriel is sent against (1 Enoch 10:9) are these giants born of the sons of Elohim and the daughters of men.'),
  ('enoch', '1-enoch', 10, 10, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The refusal that the giants should have length of days (1 Enoch 10:10) is the LORD shortening flesh''s days against their hope to live five hundred years.'),
  ('enoch', '1-enoch', 10, 9, 'jubilees', 'jubilees', 5, 9, 'extras', E'Jubilees 5:9 — *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* Jubilees tells the same command Gabriel carries in 1 Enoch 10:9 — the giants turned one against another and destroyed.'),
  -- thread: 1-enoch-10-semjaza-bound-abyss
  ('enoch', '1-enoch', 10, 12, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Michael''s binding of Semjaza for seventy generations till the day of judgement (1 Enoch 10:12) is the everlasting chains Jude says hold the fallen angels.'),
  ('enoch', '1-enoch', 10, 13, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The abyss of fire and prison that confines the Watchers in 1 Enoch 10:13 is Peter''s hell of chained darkness reserved unto judgment.'),
  ('enoch', '1-enoch', 10, 13, 'canon', 'revelation', 20, 3, 'free', E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The same shut-up-in-the-pit-and-sealed motif of 1 Enoch 10:13 governs the binding of the dragon in the abyss.'),
  ('enoch', '1-enoch', 10, 12, 'jubilees', 'jubilees', 5, 10, 'extras', E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees, like Enoch 10:12, binds the Watchers in the earth''s depths until the great judgement, their sons slain before their eyes.'),
  -- thread: 1-enoch-10-evil-spirits-from-giants
  ('enoch', '1-enoch', 10, 15, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The spirits of the reprobate Michael is sent to destroy (1 Enoch 10:15) are these unclean spirits Yahusha confronts, roaming the dry places without rest.'),
  ('enoch', '1-enoch', 10, 15, 'canon', 'matthew', 12, 45, 'free', E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The wronging of mankind by the Watchers'' spirits (1 Enoch 10:15) continues in these wicked spirits that re-enter and ruin a man.'),
  ('enoch', '1-enoch', 10, 15, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees names the spirits of 1 Enoch 10:15 as the unclean demons that lead astray and destroy mankind after the Flood.'),
  ('enoch', '1-enoch', 10, 15, 'jubilees', 'jubilees', 10, 3, 'extras', E'Jubilees 10:3 — *Elohim (God) of the spirits of all flesh, who have shown mercy to me, And have saved me and my sons from the waters of the flood, And have not caused me to perish as You did the sons of perdition... Let Your grace be lift up upon my sons, And let not wicked spirits rule over them Lest they should destroy them from the earth.* Noah''s prayer answers the wronging of mankind by the reprobate spirits (1 Enoch 10:15), begging that the wicked spirits not rule over the righteous.'),
  -- thread: 1-enoch-10-plant-of-righteousness
  ('enoch', '1-enoch', 10, 16, 'canon', 'isaiah', 24, 21, 'free', E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The same day that lets the plant of righteousness appear (1 Enoch 10:16) is the day Yahuah punishes the high host above and the kings below.'),
  ('enoch', '1-enoch', 10, 19, 'canon', 'isaiah', 65, 21, 'free', E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines yielding wine in abundance on the cleansed earth (1 Enoch 10:19) match the new-creation vineyards the elect plant and enjoy.'),
  ('enoch', '1-enoch', 10, 17, 'canon', 'isaiah', 65, 22, 'free', E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The righteous completing their days in peace (1 Enoch 10:17) are Isaiah''s elect, long-lived as a tree, enjoying their own labour.'),
  ('enoch', '1-enoch', 10, 18, 'canon', 'amos', 9, 14, 'free', E'Amos 9:14 — *And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them.* The earth tilled in righteousness and planted with trees (1 Enoch 10:18) is the regathered house of Yashar''el restored to plant and reap in the land.'),
  ('enoch', '1-enoch', 10, 16, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The order of 1 Enoch 10 — the adversary bound, then evil ended and the plant of righteousness appearing (10:16) — is Revelation''s binding of the dragon before the reign of the righteous.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-noah-warned-flood',
       E'Noah warned, the seed preserved — Genesis 6 unfolded',
       E'The archangels'' intercession ends with a command: the Most High sends Uriel to Noah — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* (1 Enoch 10:2) — and *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.''* (1 Enoch 10:3). This is the canon''s own Genesis 6 told from heaven''s side. Yahuah (LORD) had already resolved, *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* (Genesis 6:7), yet *But Noah found grace in the eyes of Yahuah (LORD).* (Genesis 6:8) — and the seed kept alive becomes the covenant line, *to keep seed alive upon the face of all the earth.* (Genesis 7:3). Jubilees tells the same intercession-and-rescue: *But Noah found grace before the eyes of Yahuah (God).* (Jubilees 5:5). Not a new myth — the Flood account the Watchers provoked, the righteous remnant preserved by election, not merit.',
       sv.verse_id, ev.verse_id, 'extras', 50225
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-azazel-bound-scapegoat',
       E'Azazel bound in the desert — the scapegoat and the abyss',
       E'Raphael is commanded against the chief Watcher: *Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* (1 Enoch 10:4), covered with jagged rocks and darkness (1 Enoch 10:5), *And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6), and to him *ascribe all sin* (1 Enoch 10:8). The Torah''s Day of Atonement carries the same name and the same desert: the lot falls *for the scapegoat* (Leviticus 16:8), the live goat *presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* (Leviticus 16:10), bearing the iniquities *unto a land not inhabited* (Leviticus 16:22) — sin laid on the desert-bound one, exactly as Azazel is bound in the desert and made to bear all sin. The New Testament names the binding plainly: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). And Isaiah sees the cosmic pattern: *Yahuah (LORD) shall punish the host of the high ones that are on high... shut up in the prison, and after many days shall they be visited.* (Isaiah 24:21-22). The Watchers'' rebellion is the seed-war''s root, not a new doctrine — the canon''s own Genesis 6, sealed under the desert until the great judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50228
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-giants-slay-each-other',
       E'The giants destroy one another — the sword sent among the seed',
       E'Gabriel is sent against the offspring of the Watchers: *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy... the children of the Watchers from amongst men... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* (1 Enoch 10:9), and their fathers'' plea for them is refused (1 Enoch 10:10). This is the giants of Genesis: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4) — and the cut-short days are the LORD''s word, *My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* (Genesis 6:3). Jubilees gives the same self-slaughter by the sword: *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* (Jubilees 5:9). The hybrid seed sown against the Creator''s order is unmade — the tares of the seed-war reaping themselves, exactly as Genesis 6 tells it.',
       sv.verse_id, ev.verse_id, 'extras', 50231
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-semjaza-bound-abyss',
       E'Semjaza bound seventy generations — chains until the great judgement',
       E'Michael is sent against the chief Watcher Semjaza and his host: *Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* (1 Enoch 10:11), and after their sons are slain, *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation* (1 Enoch 10:12), *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* (1 Enoch 10:13). The apostles state this binding as settled fact: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). Revelation shows the same key, chain, pit, and seal laid on the great adversary: *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand. And he laid hold on the dragon... and bound him a thousand years, And cast him into the bottomless pit, and shut him up, and set a seal upon him* (Revelation 20:1-3). And Isaiah names the host of high ones gathered as prisoners in the pit, *and after many days shall they be visited.* (Isaiah 24:22). The binding is the Torah''s order vindicated — rebellion against the Creator chained until the everlasting judgement, not a curse on the righteous.',
       sv.verse_id, ev.verse_id, 'extras', 50234
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-evil-spirits-from-giants',
       E'The spirits of the reprobate destroyed — the origin of the unclean spirits',
       E'Michael is charged: *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* (1 Enoch 10:15). These spirits of the dead giants are the unclean spirits the Gospels meet — Yahusha (Jesus) names their wandering nature: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* (Matthew 12:43), and their fierce multiplying, *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first.* (Matthew 12:45). Jubilees makes the origin explicit and tells how a tenth were left under Mastema to afflict men: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* (Jubilees 10:1), and Noah pleads, *Let Your grace be lift up upon my sons, And let not wicked spirits rule over them Lest they should destroy them from the earth.* (Jubilees 10:3). The disembodied spirits of the hybrid seed are the demons of the New Testament — the seed-war made plain, the canon''s Genesis 6 carried forward into the Gospels.',
       sv.verse_id, ev.verse_id, 'extras', 50237
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-10-plant-of-righteousness',
       E'The plant of righteousness — the earth cleansed and restored',
       E'The chapter turns from judgement to restoration: *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* (1 Enoch 10:16), the righteous escaping and living out their days in peace (1 Enoch 10:17), the earth tilled in righteousness, planted with vines yielding wine in abundance (1 Enoch 10:18-19), cleansed from all defilement (1 Enoch 10:20), until *all the children of men shall become righteous, and all nations shall offer adoration and shall praise Me, and all shall worship Me.* (1 Enoch 10:21). The prophets sing the same restored land for the elect remnant: *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them... for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* (Isaiah 65:21-22), and the regathered house of Yashar''el (Israel), *they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them.* (Amos 9:14). The binding-then-cleansing follows Revelation''s order — the adversary chained in the pit (Revelation 20:1-3), then the new heaven and earth. The plant of righteousness is the gathered seed of Israel restored to the land, not a church replacing the tribes — the wheat the seed-war could not choke out, planted in truth and joy for evermore.',
       sv.verse_id, ev.verse_id, 'extras', 50240
  FROM _session250_en10_lookup sv, _session250_en10_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=16
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=10 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-10-noah-warned-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The deluge Uriel announces to Noah in 1 Enoch 10:2 is this same resolve of Yahuah to blot out all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* Enoch 10:3 names the reason Noah is told to escape — his seed is preserved through every generation, the elect remnant kept by grace.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:3 — *Of fowls also of the air by sevens, the male and the female; to keep seed alive upon the face of all the earth.* The preserving of Noah''s seed for all generations (1 Enoch 10:3) is the keeping-seed-alive of the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* Jubilees carries the same Flood-intercession as Enoch 10, sparing Noah alone out of the corrupted earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-noah-warned-flood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-azazel-bound-scapegoat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement scapegoat is sent into the same desert where Azazel is bound in 1 Enoch 10:4, the sin-bearer driven out alive.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:22 — *And the goat shall bear upon him all their iniquities unto a land not inhabited: and he shall let go the goat in the wilderness.* As all sin is ascribed to Azazel and he is sealed in the wilderness (1 Enoch 10:8), so the scapegoat bears all iniquities into a land uninhabited.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude states the very binding of the Watchers Enoch 10:4-6 describes — chained in darkness until the great-day judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter, like Enoch 10:6, holds the sinning angels in chains reserved for the fire of the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 24:22 — *And they shall be gathered together, as prisoners are gathered in the pit, and shall be shut up in the prison, and after many days shall they be visited.* Isaiah''s host of the high ones shut in the pit until visited matches Azazel covered with rocks and darkness till the day of judgement (1 Enoch 10:5).'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-azazel-bound-scapegoat'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-giants-slay-each-other
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The children of the Watchers Gabriel is sent against (1 Enoch 10:9) are these giants born of the sons of Elohim and the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-giants-slay-each-other'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The refusal that the giants should have length of days (1 Enoch 10:10) is the LORD shortening flesh''s days against their hope to live five hundred years.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-giants-slay-each-other'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:9 — *And He sent His sword into their midst that each should slay his neighbour, and they began to slay each other till they all fell by the sword and were destroyed from the earth.* Jubilees tells the same command Gabriel carries in 1 Enoch 10:9 — the giants turned one against another and destroyed.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-giants-slay-each-other'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-semjaza-bound-abyss
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Michael''s binding of Semjaza for seventy generations till the day of judgement (1 Enoch 10:12) is the everlasting chains Jude says hold the fallen angels.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* The abyss of fire and prison that confines the Watchers in 1 Enoch 10:13 is Peter''s hell of chained darkness reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:3 — *And cast him into the bottomless pit, and shut him up, and set a seal upon him, that he should deceive the nations no more, till the thousand years should be fulfilled: and after that he must be loosed a little season.* The same shut-up-in-the-pit-and-sealed motif of 1 Enoch 10:13 governs the binding of the dragon in the abyss.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:10 — *And their fathers were witnesses (of their destruction), and after this they were bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways and their works before Yahuah (God).* Jubilees, like Enoch 10:12, binds the Watchers in the earth''s depths until the great judgement, their sons slain before their eyes.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-semjaza-bound-abyss'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-evil-spirits-from-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The spirits of the reprobate Michael is sent to destroy (1 Enoch 10:15) are these unclean spirits Yahusha confronts, roaming the dry places without rest.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 12:45 — *Then goeth he, and taketh with himself seven other spirits more wicked than himself, and they enter in and dwell there: and the last state of that man is worse than the first. Even so shall it be also unto this wicked generation.* The wronging of mankind by the Watchers'' spirits (1 Enoch 10:15) continues in these wicked spirits that re-enter and ruin a man.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees names the spirits of 1 Enoch 10:15 as the unclean demons that lead astray and destroy mankind after the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:3 — *Elohim (God) of the spirits of all flesh, who have shown mercy to me, And have saved me and my sons from the waters of the flood, And have not caused me to perish as You did the sons of perdition... Let Your grace be lift up upon my sons, And let not wicked spirits rule over them Lest they should destroy them from the earth.* Noah''s prayer answers the wronging of mankind by the reprobate spirits (1 Enoch 10:15), begging that the wicked spirits not rule over the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-evil-spirits-from-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-10-plant-of-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 24:21 — *And it shall come to pass in that day, that Yahuah (LORD) shall punish the host of the high ones that are on high, and the kings of the earth upon the earth.* The same day that lets the plant of righteousness appear (1 Enoch 10:16) is the day Yahuah punishes the high host above and the kings below.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The vines yielding wine in abundance on the cleansed earth (1 Enoch 10:19) match the new-creation vineyards the elect plant and enjoy.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 65:22 — *They shall not build, and another inhabit; they shall not plant, and another eat: for as the days of a tree are the days of my people, and mine elect shall long enjoy the work of their hands.* The righteous completing their days in peace (1 Enoch 10:17) are Isaiah''s elect, long-lived as a tree, enjoying their own labour.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 9:14 — *And I will bring again the captivity of my people of Yashar''el (Israel), and they shall build the waste cities, and inhabit them; and they shall plant vineyards, and drink the wine thereof; they shall also make gardens, and eat the fruit of them.* The earth tilled in righteousness and planted with trees (1 Enoch 10:18) is the regathered house of Yashar''el restored to plant and reap in the land.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The order of 1 Enoch 10 — the adversary bound, then evil ended and the plant of righteousness appearing (10:16) — is Revelation''s binding of the dragon before the reign of the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en10_lookup sv, _session250_en10_lookup tv
 WHERE t.slug='1-enoch-10-plant-of-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

