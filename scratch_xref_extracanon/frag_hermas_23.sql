-- ----- fragment: minion_hermas_23.sql (session253 hermas 23) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm23 (view _session253_herm23_lookup). Sort band base 72050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-23-willow-all-called-by-the-name
  ('lightfoot-apostolic-fathers', 'hermas', 23, 2, 'canon', 'revelation', 2, 10, 'free', E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The palm-crowns the angel sets on those who suffered for the law are the Master''s own crown of life for the faithful unto death.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 2, 'canon', 'revelation', 7, 9, 'free', E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* the crowned of palm-branches sent into the tower in raiment white as snow are the white-robed, palm-bearing throng before the throne.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 2, 'canon', 'matthew', 10, 22, 'free', E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* They that suffered for the law and were crowned are the Master''s enduring ones, saved by holding fast for the Name''s sake.'),
  -- thread: hermas-23-the-tree-is-the-law-written-on-hearts
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Michael putting the law into the hearts of the believers is the new covenant the prophet named — the law internalized, never abolished.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'ezekiel', 36, 27, 'free', E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The law set into the heart by the glorious angel is the Spirit-wrought obedience the prophet promised; the Spirit and the Torah are not rivals but one work.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The rods that are the law, placed into the hearts of the believers, are Moses'' own word — never far off, always meant for the heart and the doing.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 3, 'canon', 'isaiah', 51, 4, 'free', E'Isaiah 51:4 — *Hearken unto me, my people; and give ear unto me, O my nation: for a law shall proceed from me, and I will make my judgment to rest for a light of the people.* The tree-law given to the whole world and preached to the ends of the earth is the prophet''s law proceeding from Yahuah as a light to the peoples.'),
  -- thread: hermas-23-repentance-brings-life
  ('lightfoot-apostolic-fathers', 'hermas', 23, 6, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The abundant compassion that revives the withered rods is the prophet''s own Yahuah, who desires the wicked to turn and live, not perish.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 6, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That repentance bringeth life and the time still stands open is the Master''s longsuffering, unwilling that any should perish.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 6, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The shepherd''s gladness over every withered rod that revives is heaven''s own joy over the one sinner who turns.'),
  -- thread: hermas-23-life-for-them-that-keep-the-commandments
  ('lightfoot-apostolic-fathers', 'hermas', 23, 7, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s ''life is for all those that keep the commandments'' is the apostle''s own measure of love — the commandments stand, and they are not grievous.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 7, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The life of Yahuah dwelling in them that keep the commandments rests on the Master''s own binding of love to obedience.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 7, 'canon', 'matthew', 7, 21, 'free', E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* The factious and lawless who say but do not keep are the Master''s own who cry Lord, Lord yet do not do the Father''s will — saying is not the doing.'),
  -- thread: hermas-23-go-tell-all-to-repent-and-be-healed
  ('lightfoot-apostolic-fathers', 'hermas', 23, 11, 'canon', 'ezekiel', 18, 21, 'free', E'Ezekiel 18:21 — *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* Healing for former sins to the one who repents whole-heartedly and adds no more is the prophet''s own promise — turn, keep the statutes, and surely live.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 11, 'canon', 'james', 5, 20, 'free', E'James 5:20 — *Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* The charge to go tell all men to repent that they may live is the apostle''s own work of turning the erring back and saving a soul from death.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 11, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That the long-suffering Yahuah willeth them called through His Son to be saved is Kepha''s longsuffering that wills all to come to repentance.'),
  -- thread: hermas-23-the-rock-and-gate-the-name-of-the-son
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'john', 10, 9, 'free', E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* The one gate of the rock through which alone the saved enter the kingdom is the Master''s own word that He is the door — by Him alone any man is saved.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'john', 14, 6, 'free', E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* That no one enters the kingdom of Elohim except through the Son who is the gate is the Master''s own claim to be the sole way to the Father.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'acts', 4, 12, 'free', E'Acts 4:12 — *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved.* That none shall enter the kingdom except he receive the name of His Son is Kepha''s proclamation that there is no other saving Name under heaven.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 12, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* the Name of the Son which alone admits to the kingdom is the exalted Name before which Sha''ul says every knee shall bow.'),
  -- thread: hermas-23-tower-is-the-church-living-stones
  ('lightfoot-apostolic-fathers', 'hermas', 23, 13, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The tower the Shepherd names the Church is Kepha''s spiritual house built up of living stones.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 13, 'canon', 'ephesians', 2, 20, 'free', E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* the tower-Church built upon the rock that is the Son is Sha''ul''s building founded on the apostles and prophets with Messiah the corner stone.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 13, 'canon', 'ephesians', 2, 22, 'free', E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The stones made one with the rock, one spirit and one body, are Sha''ul''s same household builded together for a habitation of Elohim through the Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 16, 'canon', 'john', 3, 5, 'free', E'John 3:5 — *Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* The stones that must rise through water to be made alive, who go down dead and come up alive, are the Master''s own birth of water and Spirit, without which none enters the kingdom.'),
  -- thread: hermas-23-twelve-mountains-twelve-tribes-nations
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* the twelve mountains that are twelve tribes inhabiting the whole world, called into one house, are the prophet''s children of Yashar''el gathered from among the nations.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'ezekiel', 37, 22, 'free', E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* the tribes that became one body, one mind, one faith, bright as the sun, are the prophet''s twelve made one nation under one king, no more divided.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'matthew', 28, 19, 'free', E'Matthew 28:19 — *Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* the Son of Elohim preached by the Apostles to the twelve tribes scattered through all nations is the Master''s own sending to teach all nations and seal them in the Name.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 17, 'canon', 'isaiah', 49, 6, 'free', E'Isaiah 49:6 — *And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* The preaching that reaches the twelve tribes in all the world is the servant''s commission to raise up the tribes of Jacob and be salvation to the ends of the earth.'),
  -- thread: hermas-23-your-seed-shall-never-be-blotted-out
  ('lightfoot-apostolic-fathers', 'hermas', 23, 24, 'canon', 'isaiah', 65, 23, 'free', E'Isaiah 65:23 — *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them.* The promise that your seed shall never be blotted out and your whole seed shall dwell with the Son is the prophet''s word over the blessed seed of Yahuah and their offspring with them.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 24, 'canon', 'psalms', 37, 28, 'free', E'Psalm 37:28 — *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever: but the seed of the wicked shall be cut off.* The simple and guileless whose seed is never blotted out are the psalmist''s saints, preserved for ever and not forsaken.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 24, 'canon', 'matthew', 10, 22, 'free', E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* The charge to remain to the end such as ye are, enrolled among the proven, is the Master''s own promise that he who endures to the end is saved.'),
  -- thread: hermas-23-become-as-babes-the-white-mountain
  ('lightfoot-apostolic-fathers', 'hermas', 23, 29, 'canon', 'matthew', 18, 3, 'free', E'Matthew 18:3 — *And said, Verily I say unto you, Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven.* The babes without guile who dwell without doubt in the kingdom are the Master''s own little children, without whom-likeness none enters the kingdom.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 29, 'canon', 'matthew', 19, 14, 'free', E'Matthew 19:14 — *But Yahusha (Jesus) said, Suffer little children, and forbid them not, to come unto me: for of such is the kingdom of heaven.* The infants who stand first in the sight of Elohim are the Master''s own little children, of whom is the kingdom of heaven.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 29, 'canon', 'matthew', 5, 8, 'free', E'Matthew 5:8 — *Blessed are the pure in heart: for they shall see Elohim (God).* They into whose heart no guile entereth, who defiled the commandments in nothing, are the Master''s pure in heart who shall see Elohim.'),
  -- thread: hermas-23-restore-the-spirit-whole
  ('lightfoot-apostolic-fathers', 'hermas', 23, 32, 'canon', '1-thessalonians', 5, 23, 'free', E'1 Thessalonians 5:23 — *And the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The charge to restore the spirit whole as it was received is Sha''ul''s own prayer that the whole spirit and soul and body be preserved blameless.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 32, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The warning against giving back the spirit torn, as a fuller rends a whole garment, is Sha''ul''s caution not to grieve the sealing Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 23, 32, 'canon', 'psalms', 51, 10, 'free', E'Psalm 51:10 — *Create in me a clean heart, O Elohim (God); and renew a right spirit within me.* The only mending for a spirit made useless is the psalmist''s cry that Elohim create a clean heart and renew a right spirit within.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-willow-all-called-by-the-name',
       E'The willow that shelters all called by the Name — crowned who suffered for the law',
       E'The great Similitude opens beneath one tree: *He showed me a [great] willow, overshadowing plains and mountains, and under the shadow of the willow all have come who are called by the name of Yahuah (Lord).* (Hermas 23:1) The angel lops rods — the law — and gives one to every soul; and when the rods are rendered back, those whose rods bore *shoots* and *fruit* are crowned: *And the angel of Yahuah (Lord) commanded crowns to be brought... made as it were of palm-branches; and he crowned the men that had given up the rods which had the shoots and some fruit, and sent them away into the tower... these are they that suffered for the law.* (Hermas 23:2) It ain''t new — the crown of palm is the Master''s own promise to the faithful unto death: *be thou faithful unto death, and I will give thee a crown of life* (Revelation 2:10); the palm-bearing multitude already stands before the throne in Yochanan''s vision: *a great multitude... clothed with white robes, and palms in their hands* (Revelation 7:9); and the enduring are the saved: *he that endureth to the end shall be saved* (Matthew 10:22).',
       sv.verse_id, ev.verse_id, 'extras', 72050
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-the-tree-is-the-law-written-on-hearts',
       E'The great tree is the law of Elohim — put into the hearts of the believers',
       E'When Hermas asks what the tree is, the Shepherd answers with the heart of the whole vision: *this great tree which overshadows plains and mountains and all the earth is the law of Elohim (God) which was given to the whole world; and this law is the Son of Elohim (God) preached unto the ends of the earth... but the great and glorious angel is Michael... for this is he that putteth the law into the hearts of the believers... the rods are the law.* (Hermas 23:3) Mark it well: the law is not the curse and not the cast-off — it is the very tree under which the saved are sheltered, and it is *written on the heart.* It ain''t new. This is the new covenant exactly as the prophet named it: *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33); the Spirit that does the writing is the Spirit who keeps Torah alive in the believer: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27); the word was never far off but always meant for the heart: *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deuteronomy 30:14); and the law going forth to all the earth is the prophet''s own promise: *for a law shall proceed from me, and I will make my judgment to rest for a light of the people* (Isaiah 51:4).',
       sv.verse_id, ev.verse_id, 'extras', 72053
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-repentance-brings-life',
       E'Repentance bringeth life — the abundant compassion of Yahuah',
       E'The Shepherd plants the withered rods and waters them, and many revive; then he names what Hermas is seeing: *that thou mayest see the abundant compassion of Yahuah (Lord), how great and glorious it is... Thou seest then that repentance from sins bringeth life, but not to repent bringeth death.* (Hermas 23:6) The door of the second repentance stands open while the tower yet builds. It ain''t new — this is the very heart of Yahuah the prophet revealed: *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11); the Master''s longsuffering aims at nothing else: *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9); and heaven itself rejoices over the one rod that revives: *joy shall be in heaven over one sinner that repenteth* (Luke 15:7).',
       sv.verse_id, ev.verse_id, 'extras', 72056
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-life-for-them-that-keep-the-commandments',
       E'Life is for all that keep the commandments — death for the lawless',
       E'The Shepherd''s verdict on the rods is the framework''s own filter: *Life is for all those that keep the commandments of Yahuah (Lord). But in the commandments there is nothing about first places, or about glory of any kind, but about long-suffering and humility in man. In such men, therefore, is the life of Yahuah (Lord), but in factious and lawless men is death.* (Hermas 23:7) Keeping the commandments is the life; lawlessness is the death — there is no third road. It ain''t new — the beloved disciple measures the same: *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3); the Master binds love to obedience: *If ye love me, keep my commandments* (John 14:15); and warns that the saying is not the doing: *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21).',
       sv.verse_id, ev.verse_id, 'extras', 72059
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-go-tell-all-to-repent-and-be-healed',
       E'Go, tell all men to repent — healing for their former sins',
       E'The angel of repentance commissions Hermas: *Go, and tell all men to repent, and they shall live unto Elohim (God); for Yahuah (Lord) in His compassion sent me to give repentance to all... but being long-suffering Yahuah (Lord) willeth them that were called through His Son to be saved.* And the promise to the turning: *As many as shall repent from their whole heart and shall cleanse themselves from all the evil deeds afore-mentioned, and shall add nothing further to their sins, shall receive healing from Yahuah (Lord) for their former sins... and they shall live unto Elohim (God).* (Hermas 23:11) It ain''t new — the prophet set the same terms: *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* (Ezekiel 18:21); and the commission to turn the erring back is the apostle''s own: *he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins* (James 5:20).',
       sv.verse_id, ev.verse_id, 'extras', 72062
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-the-rock-and-gate-the-name-of-the-son',
       E'The rock and the gate are the Son — none enter but by His Name',
       E'The Shepherd interprets the building: *This rock and gate is the Son of Elohim (God)... The Son of Elohim (God) is older than all His creation, so that He became the Father’s adviser in His creation. Therefore also He is ancient. But the gate... He was made manifest in the last days of the consummation; therefore the gate was made recent, that they which are to be saved may enter through it into the kingdom of Elohim (God)... no one shall enter into the kingdom of Elohim (God), except he receive the name of His Son.* (Hermas 23:12) The ancient Rock made a recent gate is the Formed Son — older than creation, manifest in the flesh in the last days. It ain''t new — the Master named Himself the one door: *I am the door: by me if any man enter in, he shall be saved* (John 10:9); and the one way: *I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6); the Name is the only Name of salvation: *there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12); and before that Name every knee bows: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth* (Philippians 2:10).',
       sv.verse_id, ev.verse_id, 'extras', 72065
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-tower-is-the-church-living-stones',
       E'The tower is the Church — living stones raised through the water',
       E'The Shepherd names the building plainly: *The tower, why, this is the Church.* (Hermas 23:13) And he tells why the stones must rise through the deep: *It was necessary for them to rise up through water, that they might be made alive; for otherwise they could not enter into the kingdom of Elohim (God)... For before a man has borne the name of Elohim (God), he is dead; but when he has received the seal, he layeth aside his deadness, and resumeth life. The seal then is the water: so they go down into the water dead, and they come up alive.* (Hermas 23:16) It ain''t new. Kepha named the same house: *Ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5); Sha''ul laid its one foundation: *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone* (Ephesians 2:20), the building *in whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22); and the Master named the water-birth as the door of life: *Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God)* (John 3:5).',
       sv.verse_id, ev.verse_id, 'extras', 72068
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-twelve-mountains-twelve-tribes-nations',
       E'The twelve mountains are the twelve tribes — gathered into one body',
       E'The Shepherd unfolds the mountains: *These twelve mountains are twelve tribes that inhabit the whole world. To these tribes then the Son of Elohim (God) was preached by the Apostles... all the nations that dwell under heaven, when they heard and believed, were called by the one name of Elohim (God). So having received the seal, they had one understanding and one mind, and one faith became theirs and one love... therefore the building of the tower became of one colour, even bright as the sun.* (Hermas 23:17) Twelve tribes scattered through the whole world, preached to by the apostles, gathered into one shining house — it ain''t new. This is the prophet''s promise of the gathering of all twelve: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21), made *one nation* and *no more two* (Ezekiel 37:22); the apostles were sent to the tribes among all nations: *Go ye therefore, and teach all nations* (Matthew 28:19); and the servant''s light reaches the scattered: *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel)... a light to the Gentiles* (Isaiah 49:6).',
       sv.verse_id, ev.verse_id, 'extras', 72071
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-your-seed-shall-never-be-blotted-out',
       E'Your seed shall never be blotted out — the guileless dwell with the Son',
       E'Of the green-and-thriving mountain the angel of repentance pronounces a blessing on the simple and guileless: *remain to the end such as ye are, and your seed shall never be blotted out. For Yahuah (Lord) hath put you to the proof, and enrolled you among our number, and your whole seed shall dwell with the Son of Elohim (God); for of His Spirit did ye receive.* (Hermas 23:24) The seed kept, never blotted out, dwelling with the Son — it ain''t new. This is the prophet''s promise over the blessed seed: *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them* (Isaiah 65:23); and the psalmist''s word on the preserving of the righteous and their offspring: *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever* (Psalm 37:28). The enduring to the end is the Master''s own: *he that endureth to the end shall be saved* (Matthew 10:22).',
       sv.verse_id, ev.verse_id, 'extras', 72074
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-become-as-babes-the-white-mountain',
       E'As babes without guile — chiefest in the kingdom of Elohim',
       E'From the white mountain come the guileless: *they are as very babes, into whose heart no guile entereth... Such as these then dwell without doubt in the kingdom of Elohim (God), because they defiled the commandments of Elohim (God) in nothing... for all infants are glorious in the sight of Elohim (God), and stand first in His sight. Blessed then are ye, as many as have put away wickedness from you, and have clothed yourselves in guilelessness: ye shall live unto Elohim (God) chiefest of all.* (Hermas 23:29) Note well — the babes are blessed not for keeping nothing but for *defiling the commandments in nothing.* It ain''t new. The Master set the same door: *Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven* (Matthew 18:3); *Suffer little children, and forbid them not, to come unto me: for of such is the kingdom of heaven* (Matthew 19:14); and the pure-hearted are the ones who see Elohim: *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 72077
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-23-restore-the-spirit-whole',
       E'Restore the spirit whole — Yahuah dwelleth in men that love peace',
       E'The closing charge turns on the spirit given and the spirit returned: *Yahuah (Lord) dwelleth in men that love peace; for to Him peace is dear; but from the contentious and them that are given up to wickedness He keepeth afar off. Restore therefore to Him your spirit whole as ye received it.* And the parable of the fuller: as a man gives a whole garment and demands it back whole, *what thinkest thou Yahuah (Lord) will do to thee, He, Who gave thee the spirit whole, and thou hast made it absolutely useless...?* (Hermas 23:32) It ain''t new. Sha''ul prays for the very keeping-whole the Shepherd commands: *the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless* (1 Thessalonians 5:23); he warns against marring the sealed spirit: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30); and the psalmist''s cry is the only repair for a torn spirit: *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10).',
       sv.verse_id, ev.verse_id, 'extras', 72080
  FROM _session253_herm23_lookup sv, _session253_herm23_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=23 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-23-willow-all-called-by-the-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:10 — *Fear none of those things which thou shalt suffer: behold, the devil shall cast some of you into prison, that ye may be tried; and ye shall have tribulation ten days: be thou faithful unto death, and I will give thee a crown of life.* The palm-crowns the angel sets on those who suffered for the law are the Master''s own crown of life for the faithful unto death.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-willow-all-called-by-the-name'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 7:9 — *After this I beheld, and, lo, a great multitude, which no man could number, of all nations, and kindreds, and people, and tongues, stood before the throne, and before the Lamb, clothed with white robes, and palms in their hands;* the crowned of palm-branches sent into the tower in raiment white as snow are the white-robed, palm-bearing throng before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-willow-all-called-by-the-name'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* They that suffered for the law and were crowned are the Master''s enduring ones, saved by holding fast for the Name''s sake.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-willow-all-called-by-the-name'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-the-tree-is-the-law-written-on-hearts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Michael putting the law into the hearts of the believers is the new covenant the prophet named — the law internalized, never abolished.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The law set into the heart by the glorious angel is the Spirit-wrought obedience the prophet promised; the Spirit and the Torah are not rivals but one work.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The rods that are the law, placed into the hearts of the believers, are Moses'' own word — never far off, always meant for the heart and the doing.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 51:4 — *Hearken unto me, my people; and give ear unto me, O my nation: for a law shall proceed from me, and I will make my judgment to rest for a light of the people.* The tree-law given to the whole world and preached to the ends of the earth is the prophet''s law proceeding from Yahuah as a light to the peoples.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-tree-is-the-law-written-on-hearts'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-repentance-brings-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The abundant compassion that revives the withered rods is the prophet''s own Yahuah, who desires the wicked to turn and live, not perish.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-repentance-brings-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That repentance bringeth life and the time still stands open is the Master''s longsuffering, unwilling that any should perish.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-repentance-brings-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The shepherd''s gladness over every withered rod that revives is heaven''s own joy over the one sinner who turns.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-repentance-brings-life'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-life-for-them-that-keep-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s ''life is for all those that keep the commandments'' is the apostle''s own measure of love — the commandments stand, and they are not grievous.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-life-for-them-that-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:15 — *If ye love me, keep my commandments.* The life of Yahuah dwelling in them that keep the commandments rests on the Master''s own binding of love to obedience.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-life-for-them-that-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* The factious and lawless who say but do not keep are the Master''s own who cry Lord, Lord yet do not do the Father''s will — saying is not the doing.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-life-for-them-that-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-go-tell-all-to-repent-and-be-healed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:21 — *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die.* Healing for former sins to the one who repents whole-heartedly and adds no more is the prophet''s own promise — turn, keep the statutes, and surely live.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-go-tell-all-to-repent-and-be-healed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:20 — *Let him know, that he which converteth the sinner from the error of his way shall save a soul from death, and shall hide a multitude of sins.* The charge to go tell all men to repent that they may live is the apostle''s own work of turning the erring back and saving a soul from death.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-go-tell-all-to-repent-and-be-healed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* That the long-suffering Yahuah willeth them called through His Son to be saved is Kepha''s longsuffering that wills all to come to repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-go-tell-all-to-repent-and-be-healed'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-the-rock-and-gate-the-name-of-the-son
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:9 — *I am the door: by me if any man enter in, he shall be saved, and shall go in and out, and find pasture.* The one gate of the rock through which alone the saved enter the kingdom is the Master''s own word that He is the door — by Him alone any man is saved.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* That no one enters the kingdom of Elohim except through the Son who is the gate is the Master''s own claim to be the sole way to the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 4:12 — *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved.* That none shall enter the kingdom except he receive the name of His Son is Kepha''s proclamation that there is no other saving Name under heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* the Name of the Son which alone admits to the kingdom is the exalted Name before which Sha''ul says every knee shall bow.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-the-rock-and-gate-the-name-of-the-son'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-tower-is-the-church-living-stones
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The tower the Shepherd names the Church is Kepha''s spiritual house built up of living stones.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:20 — *And are built upon the foundation of the apostles and prophets, Yahusha HaMashiach (Jesus Christ) himself being the chief corner stone;* the tower-Church built upon the rock that is the Son is Sha''ul''s building founded on the apostles and prophets with Messiah the corner stone.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The stones made one with the rock, one spirit and one body, are Sha''ul''s same household builded together for a habitation of Elohim through the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 3:5 — *Yahusha (Jesus) answered, Verily, verily, I say unto thee, Except a man be born of water and of the Spirit, he cannot enter into the kingdom of Elohim (God).* The stones that must rise through water to be made alive, who go down dead and come up alive, are the Master''s own birth of water and Spirit, without which none enters the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-tower-is-the-church-living-stones'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-twelve-mountains-twelve-tribes-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* the twelve mountains that are twelve tribes inhabiting the whole world, called into one house, are the prophet''s children of Yashar''el gathered from among the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:22 — *And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all:* the tribes that became one body, one mind, one faith, bright as the sun, are the prophet''s twelve made one nation under one king, no more divided.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 28:19 — *Go ye therefore, and teach all nations, baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Spirit):* the Son of Elohim preached by the Apostles to the twelve tribes scattered through all nations is the Master''s own sending to teach all nations and seal them in the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=28 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 49:6 — *And he said, It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth.* The preaching that reaches the twelve tribes in all the world is the servant''s commission to raise up the tribes of Jacob and be salvation to the ends of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-twelve-mountains-twelve-tribes-nations'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-your-seed-shall-never-be-blotted-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:23 — *They shall not labour in vain, nor bring forth for trouble; for they are the seed of the blessed of Yahuah (LORD), and their offspring with them.* The promise that your seed shall never be blotted out and your whole seed shall dwell with the Son is the prophet''s word over the blessed seed of Yahuah and their offspring with them.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-your-seed-shall-never-be-blotted-out'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:28 — *For Yahuah (LORD) loveth judgment, and forsaketh not his saints; they are preserved for ever: but the seed of the wicked shall be cut off.* The simple and guileless whose seed is never blotted out are the psalmist''s saints, preserved for ever and not forsaken.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-your-seed-shall-never-be-blotted-out'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 10:22 — *And ye shall be hated of all men for my name’s sake: but he that endureth to the end shall be saved.* The charge to remain to the end such as ye are, enrolled among the proven, is the Master''s own promise that he who endures to the end is saved.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-your-seed-shall-never-be-blotted-out'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-become-as-babes-the-white-mountain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 18:3 — *And said, Verily I say unto you, Except ye be converted, and become as little children, ye shall not enter into the kingdom of heaven.* The babes without guile who dwell without doubt in the kingdom are the Master''s own little children, without whom-likeness none enters the kingdom.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-become-as-babes-the-white-mountain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:14 — *But Yahusha (Jesus) said, Suffer little children, and forbid them not, to come unto me: for of such is the kingdom of heaven.* The infants who stand first in the sight of Elohim are the Master''s own little children, of whom is the kingdom of heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-become-as-babes-the-white-mountain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:8 — *Blessed are the pure in heart: for they shall see Elohim (God).* They into whose heart no guile entereth, who defiled the commandments in nothing, are the Master''s pure in heart who shall see Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-become-as-babes-the-white-mountain'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-23-restore-the-spirit-whole
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Thessalonians 5:23 — *And the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The charge to restore the spirit whole as it was received is Sha''ul''s own prayer that the whole spirit and soul and body be preserved blameless.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-restore-the-spirit-whole'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The warning against giving back the spirit torn, as a fuller rends a whole garment, is Sha''ul''s caution not to grieve the sealing Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-restore-the-spirit-whole'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:10 — *Create in me a clean heart, O Elohim (God); and renew a right spirit within me.* The only mending for a spirit made useless is the psalmist''s cry that Elohim create a clean heart and renew a right spirit within.'
  FROM cross_reference_threads t, cross_references x, _session253_herm23_lookup sv, _session253_herm23_lookup tv
 WHERE t.slug='hermas-23-restore-the-spirit-whole'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=23 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

