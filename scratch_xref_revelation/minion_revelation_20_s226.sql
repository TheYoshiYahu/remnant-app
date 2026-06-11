-- S226 Revelation framework refinement — source fragment for the white-throne
-- cyclical-frame correction (verify_fidelity / offline_resolve gate input).
-- Authoritative migration: data-schema/migrations/session226_revelation_framework_refinement.sql
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon', 'revelation', 20, 11, 'canon', 'revelation', 11, 18, 'free', E'*And the nations were angry, and thy wrath is come, and the time of the dead, that they should be judged, and that thou shouldest give reward unto thy servants the prophets, and to the saints, and them that fear thy name, small and great; and shouldest destroy them which destroy the earth* (Revelation 11:18). The seventh trumpet already sounded the judgment of the dead — the very reckoning the great white throne now shows: *from whose face the earth and the heaven fled away* (Revelation 20:11), and the dead judged out of the books. The trumpet of chapter eleven and the throne of chapter twenty are not two judgments laid end to end but one judgment shown from two faces — two panels of the one reckoning of the souls of the dead, that no eye should miss it. The Revelation tells the one end cyclically, the same close shown and shown again, not a chain of separate sequential events.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s226_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s226_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;
