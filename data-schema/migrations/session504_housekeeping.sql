-- =====================================================================
-- Session 504 (coded S505) migration — HOUSEKEEPING of three duplicates found by users_baseline503 (Nov 15).
-- The rule Yoshi settled Nov 15 23:54 ("I have no way of knowing which one stays" — so the data decides):
--   assemblyofrop, Jeni — two 'active' subscription rows each. KEEP the row Stripe is billing (has stripe_subscription_id,
--     and the later current_period_end); the other → status='canceled', canceled_at = ended_at = now(). Nothing deleted.
--   Goshen24 — two accounts. KEEP the account holding the paid active subscription; the free duplicate keeps its row but its
--     wordpress_user_id and email are cleared (NULL) so the UNIQUE constraints free up. Nothing deleted.
-- Safety: all six rows are PRINTED (RAISE NOTICE) before any write; the block RAISES and rolls back if the data does not match
-- the rule exactly (not exactly two rows; no Stripe-billed row; both rows Stripe-billed; the free Goshen24 account seen more
-- recently than the paying one — then the account he actually logs in with is the "free" one and clearing its WP id would
-- orphan his login). Idempotent: a second run finds one active row / one linked account and reports "already done".
-- Written on Claude Fable 5.1.
-- Run (paste, from ~/Desktop/App): python3 api/apply_migration.py data-schema/migrations/session504_housekeeping.sql
--   (add --dry-run to see the six rows and the decision without writing)
-- =====================================================================
\echo 'session504 housekeeping starting...'
BEGIN;

DO $hk$
DECLARE
  r RECORD; keep_id UUID; drop_id UUID; n INT; n_stripe INT; who TEXT;
  pay_acct UUID; free_acct UUID; pay_seen TIMESTAMPTZ; free_seen TIMESTAMPTZ;
BEGIN
  -- ---------- subscription duplicates ----------
  FOREACH who IN ARRAY ARRAY['assemblyofrop', 'Jeni'] LOOP
    RAISE NOTICE '--- % : active subscription rows (BEFORE) ---', who;
    n := 0;
    FOR r IN SELECT s.id, s.tier, s.status, s.stripe_subscription_id, s.started_at, s.current_period_end, s.ended_at
               FROM subscriptions s JOIN users u ON u.id = s.user_id
              WHERE u.display_name = who AND s.status = 'active' ORDER BY s.started_at LOOP
      n := n + 1;
      RAISE NOTICE '  sub % tier=% status=% stripe=% started=% period_end=% ended=%',
        r.id, r.tier, r.status, coalesce(r.stripe_subscription_id, '(none)'), r.started_at, r.current_period_end, r.ended_at;
    END LOOP;
    IF n = 1 THEN
      RAISE NOTICE '  % : one active row — already done, nothing to write.', who; CONTINUE;
    ELSIF n <> 2 THEN
      RAISE EXCEPTION 'S504 housekeeping: % has % active rows, expected 2 — look before writing', who, n;
    END IF;
    SELECT count(*) INTO n_stripe FROM subscriptions s JOIN users u ON u.id = s.user_id
     WHERE u.display_name = who AND s.status = 'active' AND s.stripe_subscription_id IS NOT NULL;
    IF n_stripe = 0 THEN RAISE EXCEPTION 'S504 housekeeping: % — neither active row is Stripe-billed; the rule cannot decide', who; END IF;
    -- keep: Stripe-billed, latest current_period_end
    SELECT s.id INTO keep_id FROM subscriptions s JOIN users u ON u.id = s.user_id
     WHERE u.display_name = who AND s.status = 'active' AND s.stripe_subscription_id IS NOT NULL
     ORDER BY s.current_period_end DESC NULLS LAST, s.started_at DESC LIMIT 1;
    SELECT s.id INTO drop_id FROM subscriptions s JOIN users u ON u.id = s.user_id
     WHERE u.display_name = who AND s.status = 'active' AND s.id <> keep_id;
    UPDATE subscriptions SET status = 'canceled', canceled_at = now(), ended_at = now() WHERE id = drop_id;
    RAISE NOTICE '  % : KEEP % · marked canceled/ended (row stays): %', who, keep_id, drop_id;
  END LOOP;

  -- ---------- Goshen24: two accounts ----------
  RAISE NOTICE '--- Goshen24 : accounts (BEFORE) ---';
  n := 0;
  FOR r IN SELECT u.id, u.wordpress_user_id, u.email, u.created_at, u.last_seen_at,
                  (SELECT string_agg(s.tier::text || '/' || s.status::text, ', ') FROM subscriptions s WHERE s.user_id = u.id) subs
             FROM users u WHERE u.display_name = 'Goshen24' ORDER BY u.created_at LOOP
    n := n + 1;
    RAISE NOTICE '  user % wp_id=% email=% joined=% last_seen=% subs=%',
      r.id, r.wordpress_user_id, coalesce(r.email, '(none)'), r.created_at, r.last_seen_at, coalesce(r.subs, 'free only');
  END LOOP;
  IF n = 2 AND (SELECT count(*) FROM users WHERE display_name = 'Goshen24' AND wordpress_user_id IS NULL AND email IS NULL) = 1 THEN
    RAISE NOTICE '  Goshen24 : one account already unlinked — already done, nothing to write.';
  ELSIF n <> 2 THEN
    RAISE EXCEPTION 'S504 housekeeping: Goshen24 has % accounts, expected 2', n;
  ELSE
    SELECT u.id, u.last_seen_at INTO pay_acct, pay_seen FROM users u
     WHERE u.display_name = 'Goshen24'
       AND EXISTS (SELECT 1 FROM subscriptions s WHERE s.user_id = u.id AND s.status IN ('active','trialing','past_due') AND s.tier <> 'free');
    IF pay_acct IS NULL THEN RAISE EXCEPTION 'S504 housekeeping: Goshen24 — no account holds a paid active subscription'; END IF;
    IF (SELECT count(*) FROM users u WHERE u.display_name = 'Goshen24'
         AND EXISTS (SELECT 1 FROM subscriptions s WHERE s.user_id = u.id AND s.status IN ('active','trialing','past_due') AND s.tier <> 'free')) <> 1
    THEN RAISE EXCEPTION 'S504 housekeeping: Goshen24 — both accounts hold paid subscriptions; the rule cannot decide'; END IF;
    SELECT u.id, u.last_seen_at INTO free_acct, free_seen FROM users u WHERE u.display_name = 'Goshen24' AND u.id <> pay_acct;
    IF free_seen IS NOT NULL AND (pay_seen IS NULL OR free_seen > pay_seen) THEN
      RAISE EXCEPTION 'S504 housekeeping: Goshen24 — the FREE account (%) was seen more recently (%) than the paying one (%): that is the login he uses; clearing its WP id would orphan it. Not written.', free_acct, free_seen, pay_seen;
    END IF;
    UPDATE users SET wordpress_user_id = NULL, email = NULL WHERE id = free_acct;
    RAISE NOTICE '  Goshen24 : KEEP % (paid, last seen %) · unlinked free duplicate % (row stays; wp_id and email cleared)', pay_acct, pay_seen, free_acct;
  END IF;
END
$hk$;

COMMIT;
\echo 'session504 housekeeping — done.'
