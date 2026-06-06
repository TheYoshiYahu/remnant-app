-- S206 — Founder pricing across the tier ladder (Yoshi's calls, S206 mid-session)
--
-- The ladder becomes founder pricing while the app is built and
-- updated daily. SCRIBE (everything) IS HIDDEN from the pricing page
-- until the future — existing everything subscribers keep their tier;
-- the catalog rows stay in place untouched.
--
--   Study Notes  $1.99/mo (later $2.99)  — existing standard rows bill as-is
--   Library      $4.99/mo (later $7.77)  — existing standard rows bill as-is
--   Companion    $7.49/mo (later $12.99) — NEW founder rows (this file)
--   Scribe       hidden until the future
--
-- 1. Cap lifted: founder pricing stays open while the app is being
--    built (Yoshi, S206). closed_at cleared in case the old cap had
--    ever been hit.
--
-- 2. Companion (complete_study) founder rows. The Stripe founder
--    prices ALREADY EXISTED on the Complete Study (Founder Pricing)
--    product at exactly the wanted amounts — $7.49/mo and $75/yr —
--    IDs read off by Yoshi in-session (2026-06-06). No new Stripe
--    prices were created. Idempotent: ON CONFLICT updates in place.
--
--    Safety note: stripe_price_id is UNIQUE across the catalog. If
--    these two IDs were ever seeded on the everything-founder rows
--    instead, this insert fails loudly and rolls back — run with
--    --dry-run first; a unique-violation there means the IDs belong
--    to Scribe's founder rows and we stop and re-check in Stripe.

BEGIN;

UPDATE founder_pricing_counter
   SET cap = 1000000,
       closed_at = NULL
 WHERE id = 1;

INSERT INTO subscription_tier_prices
    (tier, cadence, price_cents, stripe_price_id, is_founder_pricing, is_active, notes)
VALUES
    ('complete_study', 'monthly', 749,  'price_1TdeNxPoYcjzJhjSa77iiaLE', TRUE, TRUE,
     'S206 founder pricing - Companion $7.49/mo vs $12.99 later'),
    ('complete_study', 'annual',  7500, 'price_1TdeNxPoYcjzJhjSTpfXCcPI', TRUE, TRUE,
     'S206 founder pricing - Companion $75/yr vs $129.90 later')
ON CONFLICT (tier, cadence, is_founder_pricing)
DO UPDATE SET price_cents     = EXCLUDED.price_cents,
              stripe_price_id = EXCLUDED.stripe_price_id,
              is_active       = TRUE,
              notes           = EXCLUDED.notes;

COMMIT;
