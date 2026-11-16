"""S503 — users_baseline503.py — READ-ONLY: how many accounts the Bible app has and when they were last seen. The database keeps one
last_seen_at per user (overwritten each visit), so this is the whole of what can be known today; daily distinct logins and visits per person
begin with the S504 visit counter. Prints to the terminal and to _s503/out/users_baseline_<date>.txt (not git-added). Model: Claude Fable 5.1."""
import asyncio, sys, datetime
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from dump495 import connect
Q = """
SELECT (SELECT count(*) FROM users) AS accounts,
       (SELECT count(*) FROM users WHERE last_seen_at >= now() - interval '1 day')  AS seen_1d,
       (SELECT count(*) FROM users WHERE last_seen_at >= now() - interval '7 days') AS seen_7d,
       (SELECT count(*) FROM users WHERE last_seen_at >= now() - interval '30 days') AS seen_30d,
       (SELECT count(*) FROM users WHERE created_at >= now() - interval '30 days') AS new_30d,
       (SELECT count(DISTINCT user_id) FROM subscriptions WHERE status IN ('trialing','active','past_due') AND tier <> 'free') AS paid_or_trial,
       (SELECT count(DISTINCT user_id) FROM subscriptions WHERE status = 'active' AND tier <> 'free' AND NOT is_promo_subscriber) AS paying
"""
BYDAY = "SELECT date_trunc('day', last_seen_at AT TIME ZONE 'America/Chicago')::date AS day, count(*) FROM users WHERE last_seen_at >= now() - interval '30 days' GROUP BY 1 ORDER BY 1"
EACH = """SELECT u.display_name, u.created_at::date AS joined, u.last_seen_at AT TIME ZONE 'America/Chicago' AS last_seen,
       (SELECT string_agg(s.tier::text || '/' || s.status::text, ', ') FROM subscriptions s WHERE s.user_id = u.id AND s.status IN ('trialing','active','past_due')) AS tier
  FROM users u ORDER BY u.last_seen_at DESC NULLS LAST"""
async def main():
    con = await connect(); out = []
    try:
        r = await con.fetchrow(Q)
        out += [f"Bible app accounts — baseline {datetime.date.today()}", f"  accounts: {r['accounts']}   seen last 24h: {r['seen_1d']}   last 7 days: {r['seen_7d']}   last 30 days: {r['seen_30d']}   new in 30 days: {r['new_30d']}",
                f"  on a paid tier (incl. trials/comps): {r['paid_or_trial']}   paying (active, not promo): {r['paying']}", "", "  last-seen day (America/Chicago), accounts whose LAST visit fell on it — not daily logins:"]
        for d in await con.fetch(BYDAY): out.append(f"    {d['day']}  {d['count']}")
        out += ["", "  every account — name · joined · last seen · tier:"]
        for e in await con.fetch(EACH): out.append(f"    {(e['display_name'] or '(no name)')[:28]:<28} {e['joined']}  {str(e['last_seen'])[:16] if e['last_seen'] else 'never':<17} {e['tier'] or 'free'}")
    finally: await con.close()
    txt = '\n'.join(out); print(txt); (W3 / 'out' / f'users_baseline_{datetime.date.today()}.txt').write_text(txt + '\n')
asyncio.run(main())
