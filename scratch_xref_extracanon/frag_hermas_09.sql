-- ----- fragment: minion_hermas_09.sql (session253 hermas 9) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm9 (view _session253_herm9_lookup). Sort band base 71700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-9-purity-of-heart-no-adultery
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* The Shepherd''s warning against the lustful thought entering the heart is the Master''s own teaching, not a new severity.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'ezekiel', 18, 6, 'free', E'Ezekiel 18:6 — *And hath not eaten upon the mountains, neither hath lifted up his eyes to the idols of the house of Yashar''el (Israel), neither hath defiled his neighbour’s wife, neither hath come near to a menstruous woman,* — the Torah''s portrait of the just man already names guarding the neighbour''s wife, the very purity Hermas is charged to keep.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'matthew', 5, 32, 'free', E'Matthew 5:32 — *But I say unto you, That whosoever shall put away his wife, saving for the cause of fornication, causeth her to commit adultery: and whosoever shall marry her that is divorced committeth adultery.* The Shepherd''s ruling that the man who divorces and then marries another likewise commits adultery is drawn straight from the Master''s word.'),
  -- thread: hermas-9-divorce-and-the-door-to-return
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'matthew', 19, 9, 'free', E'Matthew 19:9 — *And I say unto you, Whosoever shall put away his wife, except it be for fornication, and shall marry another, committeth adultery: and whoso marrieth her which is put away doth commit adultery.* The Shepherd''s exact ruling — divorce for fornication, but remarriage is itself adultery — is the Master''s word verbatim in substance.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', '1-corinthians', 7, 11, 'free', E'1 Corinthians 7:11 — *But and if she depart, let her remain unmarried, or be reconciled to her husband: and let not the husband put away his wife.* Paul too holds the separated spouse single for the sake of reconciliation, just as the Shepherd bids the husband abide alone that the wife may return.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 1, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The husband kept single so the penitent wife may be received mirrors Yahuah''s own desire that the sinner turn and live, not perish.'),
  -- thread: hermas-9-repentance-is-understanding
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Shepherd''s praise of repentance as great understanding matches heaven''s own joy over the sinner who turns.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The very repentance the angel presides over is the prophet''s standing summons to Israel — it ain''t new.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The understanding given to all who repent flows from Yahuah''s longsuffering, which aims that all come to repentance.'),
  -- thread: hermas-9-keep-my-commandments-and-live
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', 'matthew', 19, 17, 'free', E'Matthew 19:17 — *And he said unto him, Why callest thou me good? there is none good but one, that is, Elohim (God): but if thou wilt enter into life, keep the commandments.* The Shepherd''s ''keep my commandments and walk in them and live'' is the Master''s own answer to the man who asked how to inherit life.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 4, 'canon', 'deuteronomy', 30, 16, 'free', E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Keeping the commandments unto life and remission is Moses'' covenant word, not a later invention — the commandments stand and bring life.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 2, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s call to keep and walk in the commandments unto life is the apostle''s own measure of love — and far from grievous.'),
  ('lightfoot-apostolic-fathers', 'hermas', 9, 4, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The remission promised to those who keep the commandments and walk in purity rests on the Master''s binding of love to obedience.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-purity-of-heart-no-adultery',
       E'Look not on another''s wife — adultery of the heart',
       E'The Shepherd charges Hermas: *‘I charge thee,’ saith he, ‘to keep purity, and let not a thought enter into thy heart concerning another’s wife, or concerning fornication, or concerning any such like evil deeds; for in so doing thou committest a great sin. But remember thine own wife always, and thou shalt never go wrong.’* (Hermas 9:1) It ain''t new — the Master in the mountain reaches the same depth, sin conceived in the heart: *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* (Matthew 5:28) The Torah''s own measure of the righteous man is the man who *hath not... defiled his neighbour’s wife* (Ezekiel 18:6), and the holiness that drives out lawlessness is no later doctrine but the standing demand of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 71700
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-divorce-and-the-door-to-return',
       E'Let him abide alone, that she may repent and return',
       E'On the unfaithful wife the Shepherd rules: *‘Let him divorce her,’ saith he, ‘and let the husband abide alone: but if after divorcing his wife he shall marry another, he likewise committeth adultery.’* And then the open door: *‘Certainly,’ saith he, ‘if the husband receiveth her not, he sinneth and bringeth great sin upon himself; nay, one who hath sinned and repented must be received... For the sake of her repentance therefore the husband ought not to marry.’* (Hermas 9:1) This is no new law but the Master''s: *And I say unto you, Whosoever shall put away his wife, except it be for fornication, and shall marry another, committeth adultery* (Matthew 19:9). And the husband is held single precisely so the door of return stays open — for the heart of Yahuah is *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11).',
       sv.verse_id, ev.verse_id, 'extras', 71703
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-repentance-is-understanding',
       E'To repent is great understanding',
       E'The angel set over repentance teaches: *‘To repent is great understanding,’ saith he. ‘For the man that hath sinned understandeth that he hath done evil before Yahuah (Lord), and the deed which he hath done entereth into his heart, and he repenteth, and doeth no more evil, but doeth good lavishly, and humbleth his own soul...’* (Hermas 9:2) It ain''t new — heaven itself rejoices at this turning: *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* (Luke 15:7) And the prophet long before set the same call: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* (Ezekiel 18:30) The longsuffering of Yahuah aims at nothing else: *not willing that any should perish, but that all should come to repentance.* (2 Peter 3:9)',
       sv.verse_id, ev.verse_id, 'extras', 71706
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-9-keep-my-commandments-and-live',
       E'Keep my commandments, walk in them, and live',
       E'The Shepherd''s promise hangs on obedience: *‘Thou shalt live,’ saith he, ‘if thou keep my commandments and walk in them; and whosoever shall hear these commandments and keep them, shall live unto Elohim (God).’* (Hermas 9:2) And again at the close: *‘But for thy former transgressions there shall be remission, if thou keepest my com- mandments. Yea, and all shall have remission, if they keep these my commandments, and walk in this purity.’* (Hermas 9:4) It ain''t new — this is Moses'' own life-set-before-you: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), and the Master''s plain word: *but if thou wilt enter into life, keep the commandments* (Matthew 19:17). The beloved disciple says the same — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3) — and the Master ties love itself to obedience: *If ye love me, keep my commandments* (John 14:15). The commandments stand; they are never the curse.',
       sv.verse_id, ev.verse_id, 'extras', 71709
  FROM _session253_herm9_lookup sv, _session253_herm9_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-9-purity-of-heart-no-adultery
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* The Shepherd''s warning against the lustful thought entering the heart is the Master''s own teaching, not a new severity.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-purity-of-heart-no-adultery'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:6 — *And hath not eaten upon the mountains, neither hath lifted up his eyes to the idols of the house of Yashar''el (Israel), neither hath defiled his neighbour’s wife, neither hath come near to a menstruous woman,* — the Torah''s portrait of the just man already names guarding the neighbour''s wife, the very purity Hermas is charged to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-purity-of-heart-no-adultery'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:32 — *But I say unto you, That whosoever shall put away his wife, saving for the cause of fornication, causeth her to commit adultery: and whosoever shall marry her that is divorced committeth adultery.* The Shepherd''s ruling that the man who divorces and then marries another likewise commits adultery is drawn straight from the Master''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-purity-of-heart-no-adultery'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-9-divorce-and-the-door-to-return
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 19:9 — *And I say unto you, Whosoever shall put away his wife, except it be for fornication, and shall marry another, committeth adultery: and whoso marrieth her which is put away doth commit adultery.* The Shepherd''s exact ruling — divorce for fornication, but remarriage is itself adultery — is the Master''s word verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-divorce-and-the-door-to-return'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 7:11 — *But and if she depart, let her remain unmarried, or be reconciled to her husband: and let not the husband put away his wife.* Paul too holds the separated spouse single for the sake of reconciliation, just as the Shepherd bids the husband abide alone that the wife may return.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-divorce-and-the-door-to-return'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The husband kept single so the penitent wife may be received mirrors Yahuah''s own desire that the sinner turn and live, not perish.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-divorce-and-the-door-to-return'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-9-repentance-is-understanding
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Shepherd''s praise of repentance as great understanding matches heaven''s own joy over the sinner who turns.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-repentance-is-understanding'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The very repentance the angel presides over is the prophet''s standing summons to Israel — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-repentance-is-understanding'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The understanding given to all who repent flows from Yahuah''s longsuffering, which aims that all come to repentance.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-repentance-is-understanding'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-9-keep-my-commandments-and-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 19:17 — *And he said unto him, Why callest thou me good? there is none good but one, that is, Elohim (God): but if thou wilt enter into life, keep the commandments.* The Shepherd''s ''keep my commandments and walk in them and live'' is the Master''s own answer to the man who asked how to inherit life.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:16 — *In that I command thee this day to love Yahuah Elohayka (the LORD thy God), to walk in his ways, and to keep his commandments and his statutes and his judgments, that thou mayest live and multiply: and Yahuah Elohayka (the LORD thy God) shall bless thee in the land whither thou goest to possess it.* Keeping the commandments unto life and remission is Moses'' covenant word, not a later invention — the commandments stand and bring life.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The Shepherd''s call to keep and walk in the commandments unto life is the apostle''s own measure of love — and far from grievous.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 14:15 — *If ye love me, keep my commandments.* The remission promised to those who keep the commandments and walk in purity rests on the Master''s binding of love to obedience.'
  FROM cross_reference_threads t, cross_references x, _session253_herm9_lookup sv, _session253_herm9_lookup tv
 WHERE t.slug='hermas-9-keep-my-commandments-and-live'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

