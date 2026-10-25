"""
activity_report.py — how active readers are (S467). Read-only.

    python -m jobs.activity_report            # last 7 days
    python -m jobs.activity_report --days 30
"""
from __future__ import annotations

import argparse
import asyncio

from db import close_pool, get_pool, open_pool


async def _run(days: int) -> None:
    await open_pool()
    try:
        async with get_pool().acquire() as c:
            print(f"\n== Each day, last {days} days (Central time) ==")
            for r in await c.fetch(
                "SELECT day, count(*) people, sum(visits) visits, "
                "       round(avg(active_seconds)/60.0,1) avg_min "
                "  FROM user_activity_days "
                " WHERE day > (now() AT TIME ZONE 'America/Chicago')::date - $1 "
                " GROUP BY day ORDER BY day", days):
                print(f"{r['day']}  people={r['people']}  visits={r['visits']}  avg_minutes={r['avg_min']}")

            print(f"\n== How many days each person came, last {days} days ==")
            for r in await c.fetch(
                "SELECT n_days, count(*) people FROM ("
                "  SELECT user_id, count(*) n_days FROM user_activity_days "
                "   WHERE day > (now() AT TIME ZONE 'America/Chicago')::date - $1 "
                "   GROUP BY user_id) t GROUP BY n_days ORDER BY n_days DESC", days):
                print(f"came {r['n_days']} day(s): {r['people']} people")

            print(f"\n== Per person, last {days} days ==")
            for r in await c.fetch(
                "SELECT coalesce(u.display_name, 'account ' || u.wordpress_user_id) who, "
                "       count(*) n_days, sum(a.visits) visits, "
                "       round(sum(a.active_seconds)/60.0) minutes "
                "  FROM user_activity_days a JOIN users u ON u.id = a.user_id "
                " WHERE a.day > (now() AT TIME ZONE 'America/Chicago')::date - $1 "
                " GROUP BY who ORDER BY n_days DESC, minutes DESC", days):
                print(f"{r['who']}: {r['n_days']} day(s), {r['visits']} visit(s), ~{r['minutes']} min")
            print()
    finally:
        await close_pool()


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--days", type=int, default=7)
    asyncio.run(_run(ap.parse_args().days))


if __name__ == "__main__":
    main()
