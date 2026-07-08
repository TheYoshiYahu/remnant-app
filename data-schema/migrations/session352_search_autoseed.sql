-- =====================================================================
-- Session 352 migration — Search dictionary AUTO-SEED (Phase 2)
-- 2026-07-07
-- =====================================================================
-- Pure DATA-SEED. No schema change — every row lands in the existing
-- search_expansion_groups / search_expansion_terms tables built at S150
-- (session150_search_engine_v2.sql) and first seeded with concepts at
-- S151 (session151_concept_groups.sql). This migration fills the
-- near-empty dictionaries the S352 search rebuild depends on so that
-- Related-mode expansion (synonym tier 3, concept tier 5) actually has
-- material to work with.
--
-- IDEMPOTENT. Every INSERT is guarded (ON CONFLICT DO NOTHING against
-- the (kind,label) group unique constraint and the (group_id,term) term
-- PK), so re-applying is safe. Wrapped in a single BEGIN/COMMIT — the
-- api/apply_migration.py harness executes the whole body as one block
-- and rolls back on any error.
--
-- SIX seed layers:
--   1. MINED synonym pairs — the "Restored (Familiar)" parenthetical
--      glosses already sitting in verses.text (Yahuah (LORD), Messiah
--      (Christ), Yashar'el (Israel), Elohim (God), Mosheh (Moses), ...).
--      Extracted programmatically at apply-time via regexp against the
--      live corpus, so the pairs reflect exactly what the restoration
--      pipeline emitted. Skips pairs already covered by a curated
--      synonym group (dedupe).
--   2. CURATED sacred-name / alias synonyms — the rest of the false-
--      name → restored-name web the mask map and framework name for
--      (Jesus↔Yahusha, Jehovah/Yahweh↔Yahuah, ...). Bidirectional:
--      every variant lives in one group and OR-expands to all others.
--   3. MODERN ↔ ARCHAIC/KJV synonyms (S352 accessibility layer). The
--      corpus is KJV-style archaic, so a reader's modern word misses.
--      donkey↔ass, boat↔ship/vessel, clothes↔raiment/garment,
--      lamp↔candle, money↔silver/mammon, snake↔serpent, jail↔prison,
--      food↔meat/victuals, ... A big win across the WHOLE corpus.
--   4. FAMOUS-STORIES concepts (S352). Plain-language descriptions of
--      well-known passages → distinctive anchor words/phrases that
--      appear in those passages, so "talking donkey" surfaces Balaam
--      (Numbers 22), "burning bush" surfaces Exodus 3, "lions' den"
--      Daniel 6, "great fish"/"whale" Jonah, etc. Fires in Related mode.
--   5. CROSS-REFERENCE-THREAD concepts — every curated
--      cross_reference_threads row → one concept cluster keyed off its
--      title, so a thread word (e.g. "seed") surfaces the thread's
--      linked language in Related mode.
--   6. schema_version bump.
--
-- Layers 2/3/4 are the "curated alias / story files": they live in the
-- clearly delimited VALUES blocks below. To EXTEND them, add rows to the
-- relevant temp-table INSERT and re-apply — the ON CONFLICT guards make
-- that safe and additive.
--
-- Apply (Render shell / local, see session352 deploy note):
--   DATABASE_URL='postgresql://...' python3 api/apply_migration.py \
--       data-schema/migrations/session352_search_autoseed.sql
-- =====================================================================

BEGIN;

-- ---------------------------------------------------------------------
-- Layer 1 — MINE the "Restored (Familiar)" parenthetical glosses.
-- ---------------------------------------------------------------------
-- The restoration pipeline writes the familiar form in parentheses right
-- after the restored form: "Yahuah (LORD)", "Elohim (God)",
-- "Yashar'el (Israel)". Extract every distinct <Restored> <(Familiar)>
-- pair where both sides are capitalized tokens, and fold each into a
-- bidirectional synonym group — UNLESS the restored token is already
-- covered by a curated synonym group (dedupe against S150 + Layer 2).
DO $mine$
DECLARE
    rec        RECORD;
    grp_label  TEXT;
    grp_id     INT;
BEGIN
    FOR rec IN
        SELECT DISTINCT m[1] AS restored, m[2] AS familiar
          FROM verses v,
               LATERAL regexp_matches(
                   v.text,
                   '([A-Z][A-Za-z''-]{2,})\s+\(([A-Z][A-Za-z''-]{1,})\)',
                   'g'
               ) AS m
         WHERE lower(m[1]) <> lower(m[2])
    LOOP
        -- Dedupe: skip if the restored token is already a term in ANY
        -- synonym group (curated names already carry their variants).
        IF EXISTS (
            SELECT 1
              FROM search_expansion_terms t
              JOIN search_expansion_groups g ON g.id = t.group_id
             WHERE g.kind = 'synonym'
               AND lower(t.term) = lower(rec.restored)
        ) THEN
            CONTINUE;
        END IF;

        grp_label := 'mined_' || lower(regexp_replace(rec.restored, '[^A-Za-z]', '', 'g'));

        INSERT INTO search_expansion_groups (kind, label, notes)
        VALUES ('synonym', grp_label,
                'S352 auto-mined from the restored/familiar parenthetical '
                'gloss in verses.text: ' || rec.restored || ' (' || rec.familiar || ').')
        ON CONFLICT (kind, label) DO NOTHING;

        SELECT id INTO grp_id
          FROM search_expansion_groups
         WHERE kind = 'synonym' AND label = grp_label;

        INSERT INTO search_expansion_terms (group_id, term, is_phrase)
        VALUES (grp_id, rec.restored, false),
               (grp_id, rec.familiar, false)
        ON CONFLICT (group_id, term) DO NOTHING;
    END LOOP;
END
$mine$;


-- ---------------------------------------------------------------------
-- Layers 2 + 3 — CURATED synonym groups (sacred-name aliases +
-- modern/archaic). Loaded via a temp table so the VALUES block reads as
-- an editable "alias file". label prefixes: alias_* (names), ma_*
-- (modern/archaic). is_phrase is always false — synonyms are token-level
-- (the tsquery OR-expands single lexemes). Multi-word ideas belong in
-- the concept layer (Layer 4), not here.
-- ---------------------------------------------------------------------
CREATE TEMP TABLE _s352_syn (label TEXT, notes TEXT, term TEXT)
    ON COMMIT DROP;

-- ---- Layer 2: sacred-name / framework aliases ----------------------
INSERT INTO _s352_syn (label, notes, term) VALUES
  -- Father's name (belt-and-suspenders alongside S150 'yahuah').
  ('alias_yahuah', 'S352 — Father''s name variants.', 'Yahuah'),
  ('alias_yahuah', NULL, 'Yahweh'),
  ('alias_yahuah', NULL, 'Jehovah'),
  ('alias_yahuah', NULL, 'Yahveh'),
  ('alias_yahuah', NULL, 'YHWH'),
  ('alias_yahuah', NULL, 'YHVH'),
  -- Son's name.
  ('alias_yahusha', 'S352 — Son''s name variants (Joshua excluded — too ambiguous).', 'Yahusha'),
  ('alias_yahusha', NULL, 'Jesus'),
  ('alias_yahusha', NULL, 'Yeshua'),
  ('alias_yahusha', NULL, 'Yahshua'),
  ('alias_yahusha', NULL, 'Yahushua'),
  ('alias_yahusha', NULL, 'Iesous'),
  -- Set-apart / holy.
  ('alias_setapart', 'S352 — set-apart / holy / sanctified surface.', 'holy'),
  ('alias_setapart', NULL, 'set-apart'),
  ('alias_setapart', NULL, 'sanctified'),
  ('alias_setapart', NULL, 'hallowed'),
  -- Assembly / congregation / church.
  ('alias_assembly', 'S352 — the called-out body across translations.', 'assembly'),
  ('alias_assembly', NULL, 'congregation'),
  ('alias_assembly', NULL, 'church'),
  -- Torah / law / instruction.
  ('alias_torah', 'S352 — Torah / law / instruction.', 'Torah'),
  ('alias_torah', NULL, 'law'),
  ('alias_torah', NULL, 'instruction'),
  ('alias_torah', NULL, 'commandment');

-- ---- Layer 3: modern <-> archaic / KJV ------------------------------
-- The accessibility layer. Each group is one meaning rendered across the
-- modern word a reader types AND the archaic word(s) the KJV corpus uses.
INSERT INTO _s352_syn (label, notes, term) VALUES
  ('ma_donkey',   'S352 modern/archaic — donkey/ass.', 'donkey'),
  ('ma_donkey',   NULL, 'ass'),
  ('ma_donkey',   NULL, 'colt'),
  ('ma_donkey',   NULL, 'mule'),

  ('ma_boat',     'S352 modern/archaic — boat/ship/vessel.', 'boat'),
  ('ma_boat',     NULL, 'ship'),
  ('ma_boat',     NULL, 'vessel'),

  ('ma_clothes',  'S352 modern/archaic — clothes/raiment/garment.', 'clothes'),
  ('ma_clothes',  NULL, 'clothing'),
  ('ma_clothes',  NULL, 'raiment'),
  ('ma_clothes',  NULL, 'garment'),
  ('ma_clothes',  NULL, 'garments'),
  ('ma_clothes',  NULL, 'apparel'),
  ('ma_clothes',  NULL, 'attire'),

  ('ma_lamp',     'S352 modern/archaic — lamp/candle/lantern.', 'lamp'),
  ('ma_lamp',     NULL, 'candle'),
  ('ma_lamp',     NULL, 'lantern'),

  ('ma_money',    'S352 modern/archaic — money/silver/mammon.', 'money'),
  ('ma_money',    NULL, 'silver'),
  ('ma_money',    NULL, 'mammon'),
  ('ma_money',    NULL, 'riches'),

  ('ma_happy',    'S352 modern/archaic — happy/blessed/glad.', 'happy'),
  ('ma_happy',    NULL, 'blessed'),
  ('ma_happy',    NULL, 'glad'),
  ('ma_happy',    NULL, 'joyful'),

  ('ma_snake',    'S352 modern/archaic — snake/serpent/viper/adder.', 'snake'),
  ('ma_snake',    NULL, 'serpent'),
  ('ma_snake',    NULL, 'viper'),
  ('ma_snake',    NULL, 'adder'),

  ('ma_jail',     'S352 modern/archaic — jail/prison/ward/dungeon.', 'jail'),
  ('ma_jail',     NULL, 'prison'),
  ('ma_jail',     NULL, 'ward'),
  ('ma_jail',     NULL, 'dungeon'),

  ('ma_well',     'S352 modern/archaic — well/pit/cistern.', 'well'),
  ('ma_well',     NULL, 'pit'),
  ('ma_well',     NULL, 'cistern'),

  ('ma_food',     'S352 modern/archaic — food/meat/victuals (KJV "meat"=food).', 'food'),
  ('ma_food',     NULL, 'meat'),
  ('ma_food',     NULL, 'victuals'),

  ('ma_grave',    'S352 modern/archaic — grave/tomb/sepulchre.', 'grave'),
  ('ma_grave',    NULL, 'tomb'),
  ('ma_grave',    NULL, 'sepulchre'),
  ('ma_grave',    NULL, 'sepulcher'),

  ('ma_crowd',    'S352 modern/archaic — crowd/multitude/throng.', 'crowd'),
  ('ma_crowd',    NULL, 'multitude'),
  ('ma_crowd',    NULL, 'throng'),

  ('ma_letter',   'S352 modern/archaic — letter/epistle.', 'letter'),
  ('ma_letter',   NULL, 'epistle'),

  ('ma_teacher',  'S352 modern/archaic — teacher/master/rabbi.', 'teacher'),
  ('ma_teacher',  NULL, 'master'),
  ('ma_teacher',  NULL, 'rabbi'),
  ('ma_teacher',  NULL, 'teacher'),

  ('ma_servant',  'S352 modern/archaic — servant/handmaid/bondservant.', 'servant'),
  ('ma_servant',  NULL, 'handmaid'),
  ('ma_servant',  NULL, 'handmaiden'),
  ('ma_servant',  NULL, 'bondservant'),
  ('ma_servant',  NULL, 'bondman'),

  ('ma_soldier',  'S352 modern/archaic — soldier/warrior/mighty man.', 'soldier'),
  ('ma_soldier',  NULL, 'warrior'),
  ('ma_soldier',  NULL, 'soldiers'),

  ('ma_gift',     'S352 modern/archaic — gift/present/offering.', 'gift'),
  ('ma_gift',     NULL, 'present'),
  ('ma_gift',     NULL, 'offering'),

  ('ma_earthquake','S352 modern/archaic — earthquake/quake.', 'earthquake'),
  ('ma_earthquake',NULL, 'quake'),

  ('ma_flood',    'S352 modern/archaic — flood/deluge.', 'flood'),
  ('ma_flood',    NULL, 'deluge'),

  ('ma_farmer',   'S352 modern/archaic — farmer/husbandman/sower.', 'farmer'),
  ('ma_farmer',   NULL, 'husbandman'),
  ('ma_farmer',   NULL, 'sower'),

  ('ma_kill',     'S352 modern/archaic — kill/slay/smite/slew.', 'kill'),
  ('ma_kill',     NULL, 'slay'),
  ('ma_kill',     NULL, 'smite'),
  ('ma_kill',     NULL, 'slew');

-- Materialize the curated synonym groups + terms.
INSERT INTO search_expansion_groups (kind, label, notes)
SELECT 'synonym', s.label, min(s.notes)
  FROM _s352_syn s
 GROUP BY s.label
ON CONFLICT (kind, label) DO NOTHING;

INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, s.term, false
  FROM _s352_syn s
  JOIN search_expansion_groups g
    ON g.kind = 'synonym' AND g.label = s.label
ON CONFLICT (group_id, term) DO NOTHING;


-- ---------------------------------------------------------------------
-- Layer 4 — FAMOUS-STORIES concepts (S352).
-- ---------------------------------------------------------------------
-- Each group pairs the plain-language things a reader types (is_phrase
-- true for multi-word triggers) with DISTINCTIVE anchor words/phrases
-- that actually occur in the target passage. _expand_concepts turns the
-- non-matched terms into ILIKE patterns against verses.text, so typing a
-- trigger surfaces the passage. Anchors are chosen to be distinctive
-- (proper nouns / rare phrases) to avoid substring false-positives — e.g.
-- "Balaam" not bare "ass", "den of lions" not bare "den".
CREATE TEMP TABLE _s352_story (label TEXT, notes TEXT, term TEXT, is_phrase BOOLEAN)
    ON COMMIT DROP;

INSERT INTO _s352_story (label, notes, term, is_phrase) VALUES
  -- Balaam's talking donkey — Numbers 22.
  ('story_talking_donkey', 'S352 famous story — Balaam''s talking donkey (Numbers 22).', 'talking donkey', true),
  ('story_talking_donkey', NULL, 'talking ass', true),
  ('story_talking_donkey', NULL, 'donkey that talked', true),
  ('story_talking_donkey', NULL, 'donkey spoke', true),
  ('story_talking_donkey', NULL, 'Balaam', false),

  -- Burning bush — Exodus 3.
  ('story_burning_bush', 'S352 famous story — the burning bush (Exodus 3).', 'burning bush', true),
  ('story_burning_bush', NULL, 'bush burned', true),
  ('story_burning_bush', NULL, 'bush was not consumed', true),

  -- Parting the Red Sea — Exodus 14.
  ('story_red_sea', 'S352 famous story — parting the Red Sea (Exodus 14).', 'parting the red sea', true),
  ('story_red_sea', NULL, 'part the sea', true),
  ('story_red_sea', NULL, 'parted the sea', true),
  ('story_red_sea', NULL, 'crossing the red sea', true),
  ('story_red_sea', NULL, 'Red sea', true),

  -- Daniel in the lions' den — Daniel 6.
  ('story_lions_den', 'S352 famous story — Daniel in the lions'' den (Daniel 6).', 'lions den', true),
  ('story_lions_den', NULL, 'lion''s den', true),
  ('story_lions_den', NULL, 'lions'' den', true),
  ('story_lions_den', NULL, 'den of lions', true),

  -- Fiery furnace — Daniel 3.
  ('story_fiery_furnace', 'S352 famous story — the fiery furnace (Daniel 3).', 'fiery furnace', true),
  ('story_fiery_furnace', NULL, 'burning furnace', true),
  ('story_fiery_furnace', NULL, 'burning fiery furnace', true),
  ('story_fiery_furnace', NULL, 'Shadrach', false),

  -- Writing on the wall — Daniel 5.
  ('story_writing_on_wall', 'S352 famous story — the writing on the wall (Daniel 5).', 'writing on the wall', true),
  ('story_writing_on_wall', NULL, 'handwriting on the wall', true),
  ('story_writing_on_wall', NULL, 'Belshazzar', false),

  -- Jonah and the great fish / whale — Jonah 1-2.
  ('story_great_fish', 'S352 famous story — Jonah and the great fish / whale (Jonah 1-2).', 'whale', false),
  ('story_great_fish', NULL, 'great fish', true),
  ('story_great_fish', NULL, 'swallowed by a whale', true),
  ('story_great_fish', NULL, 'belly of the fish', true),
  ('story_great_fish', NULL, 'Jonah', false),

  -- David and Goliath — 1 Samuel 17.
  ('story_david_goliath', 'S352 famous story — David and Goliath (1 Samuel 17).', 'david and goliath', true),
  ('story_david_goliath', NULL, 'Goliath', false),

  -- Noah's ark and the flood — Genesis 6-8.
  ('story_noahs_ark', 'S352 famous story — Noah''s ark (Genesis 6-8).', 'noahs ark', true),
  ('story_noahs_ark', NULL, 'noah''s ark', true),
  ('story_noahs_ark', NULL, 'gopher wood', true),
  ('story_noahs_ark', NULL, 'Noah', false),

  -- Tower of Babel — Genesis 11.
  ('story_tower_babel', 'S352 famous story — Tower of Babel (Genesis 11).', 'tower of babel', true),
  ('story_tower_babel', NULL, 'Babel', false),

  -- Gideon's fleece — Judges 6.
  ('story_gideon_fleece', 'S352 famous story — Gideon''s fleece (Judges 6).', 'gideon''s fleece', true),
  ('story_gideon_fleece', NULL, 'the fleece', true),
  ('story_gideon_fleece', NULL, 'fleece of wool', true),
  ('story_gideon_fleece', NULL, 'fleece', false),

  -- Still small voice — 1 Kings 19.
  ('story_still_small_voice', 'S352 famous story — the still small voice (1 Kings 19).', 'still small voice', true),

  -- Jacob's ladder — Genesis 28.
  ('story_jacobs_ladder', 'S352 famous story — Jacob''s ladder (Genesis 28).', 'jacob''s ladder', true),
  ('story_jacobs_ladder', NULL, 'stairway to heaven', true),
  ('story_jacobs_ladder', NULL, 'ladder set up', true),

  -- Valley of dry bones — Ezekiel 37.
  ('story_dry_bones', 'S352 famous story — valley of dry bones (Ezekiel 37).', 'valley of dry bones', true),
  ('story_dry_bones', NULL, 'dry bones', true),
  ('story_dry_bones', NULL, 'bones came together', true),

  -- Good Samaritan — Luke 10.
  ('story_good_samaritan', 'S352 famous story — the good Samaritan (Luke 10).', 'good samaritan', true),
  ('story_good_samaritan', NULL, 'Samaritan', false),

  -- Prodigal son — Luke 15.
  ('story_prodigal_son', 'S352 famous story — the prodigal son (Luke 15).', 'prodigal son', true),
  ('story_prodigal_son', NULL, 'prodigal', false),
  ('story_prodigal_son', NULL, 'fatted calf', true),
  ('story_prodigal_son', NULL, 'riotous living', true),

  -- Feeding the five thousand — the loaves and fishes.
  ('story_loaves_fishes', 'S352 famous story — feeding the five thousand (loaves and fishes).', 'loaves and fishes', true),
  ('story_loaves_fishes', NULL, 'feeding the five thousand', true),
  ('story_loaves_fishes', NULL, 'five loaves', true),
  ('story_loaves_fishes', NULL, 'two fishes', true),

  -- Walking on water — Matthew 14 / Mark 6 / John 6.
  ('story_walking_on_water', 'S352 famous story — walking on water.', 'walking on water', true),
  ('story_walking_on_water', NULL, 'walking on the sea', true),

  -- Ten Commandments — Exodus 20.
  ('story_ten_commandments', 'S352 famous story — the Ten Commandments (Exodus 20).', 'ten commandments', true),
  ('story_ten_commandments', NULL, 'tables of stone', true);

INSERT INTO search_expansion_groups (kind, label, notes)
SELECT 'concept', s.label, min(s.notes)
  FROM _s352_story s
 GROUP BY s.label
ON CONFLICT (kind, label) DO NOTHING;

INSERT INTO search_expansion_terms (group_id, term, is_phrase)
SELECT g.id, s.term, s.is_phrase
  FROM _s352_story s
  JOIN search_expansion_groups g
    ON g.kind = 'concept' AND g.label = s.label
ON CONFLICT (group_id, term) DO NOTHING;


-- ---------------------------------------------------------------------
-- Layer 5 — CROSS-REFERENCE-THREAD concepts.
-- ---------------------------------------------------------------------
-- Every curated cross_reference_threads row becomes one concept cluster:
--   * the full title as a phrase term (so "seed of promise" matches), and
--   * each significant title word as a token term (so "seed" matches),
-- surfacing the thread's language in Related mode. Idempotent.
DO $threads$
DECLARE
    rec      RECORD;
    grp_id   INT;
BEGIN
    FOR rec IN SELECT id, slug, title FROM cross_reference_threads LOOP
        INSERT INTO search_expansion_groups (kind, label, notes)
        VALUES ('concept', 'thread_' || rec.slug,
                'S352 auto-seed from cross_reference_thread ' || rec.slug
                || ': ' || rec.title)
        ON CONFLICT (kind, label) DO NOTHING;

        SELECT id INTO grp_id
          FROM search_expansion_groups
         WHERE kind = 'concept' AND label = 'thread_' || rec.slug;

        -- Full title as a phrase.
        INSERT INTO search_expansion_terms (group_id, term, is_phrase)
        VALUES (grp_id, rec.title, position(' ' in rec.title) > 0)
        ON CONFLICT (group_id, term) DO NOTHING;

        -- Significant title words (>= 4 chars, not stopwords) as tokens.
        INSERT INTO search_expansion_terms (group_id, term, is_phrase)
        SELECT grp_id, lower(tok), false
          FROM regexp_split_to_table(rec.title, '\s+') AS tok
         WHERE length(tok) >= 4
           AND lower(regexp_replace(tok, '[^A-Za-z]', '', 'g')) NOT IN (
                 'the','and','from','with','unto','your','their','that',
                 'this','they','them','then','than','into','over','upon',
                 'shall','will','when','what','who''s','whom')
        ON CONFLICT (group_id, term) DO NOTHING;
    END LOOP;
END
$threads$;


-- ---------------------------------------------------------------------
-- Verify (lower-bound sanity — mined counts vary with the live corpus).
-- ---------------------------------------------------------------------
DO $verify$
DECLARE
    syn_groups   INT;
    con_groups   INT;
    donkey_terms INT;
    story_donkey INT;
    thread_cons  INT;
BEGIN
    SELECT count(*) INTO syn_groups
      FROM search_expansion_groups WHERE kind = 'synonym';
    SELECT count(*) INTO con_groups
      FROM search_expansion_groups WHERE kind = 'concept';
    RAISE NOTICE 'S352 verify: synonym groups=% concept groups=%',
        syn_groups, con_groups;

    -- donkey/ass modern-archaic group must carry both terms.
    SELECT count(*) INTO donkey_terms
      FROM search_expansion_terms t
      JOIN search_expansion_groups g ON g.id = t.group_id
     WHERE g.kind = 'synonym' AND g.label = 'ma_donkey'
       AND lower(t.term) IN ('donkey', 'ass');
    IF donkey_terms < 2 THEN
        RAISE EXCEPTION 'S352 verify: ma_donkey missing donkey/ass (got %)', donkey_terms;
    END IF;

    -- talking-donkey story concept must exist and anchor Balaam.
    SELECT count(*) INTO story_donkey
      FROM search_expansion_terms t
      JOIN search_expansion_groups g ON g.id = t.group_id
     WHERE g.kind = 'concept' AND g.label = 'story_talking_donkey'
       AND lower(t.term) = 'balaam';
    IF story_donkey < 1 THEN
        RAISE EXCEPTION 'S352 verify: story_talking_donkey missing Balaam anchor';
    END IF;

    -- At least one thread-derived concept landed.
    SELECT count(*) INTO thread_cons
      FROM search_expansion_groups
     WHERE kind = 'concept' AND label LIKE 'thread_%';
    RAISE NOTICE 'S352 verify: thread concept groups=%', thread_cons;

    -- Deterministic floor: 5 alias_* + 21 ma_* curated groups = 26,
    -- regardless of how many pairs Layer-1 mining adds from the corpus.
    IF syn_groups < 26 THEN
        RAISE EXCEPTION 'S352 verify: expected >= 26 synonym groups, got %', syn_groups;
    END IF;
END
$verify$;


-- ---------------------------------------------------------------------
-- schema_version bump.
-- ---------------------------------------------------------------------
UPDATE schema_version
   SET version   = '1.0.0-phase4-session352',
       landed_at = now(),
       notes     = 'S352 search auto-seed — mined restored/familiar synonym '
                   'pairs + curated sacred-name aliases + modern/archaic '
                   'synonyms + famous-stories concepts + cross-reference-thread '
                   'concepts. Data-seed only; no schema change.'
 WHERE id = 1;

COMMIT;
