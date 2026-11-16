"""S504 — visits_report504.py — READ-ONLY: how many different people come each day, and how many times each (Yoshi's question, Nov 15).
Signed-in readers from S467's user_activity_days (counting since S467b deployed); anonymous readers and the walk site from
visit_events (counting since the S504 beacon deployed). Prints the Nov 15 baseline (users_baseline503) on top for comparison.
Terminal + _s503/out/visits_<date>.txt (not git-added).   Run: python3 ~/Desktop/App/_s503/tools/visits_report504.py [--days 30]
Model: Claude Fable 5.1."""
import asyncio, sys, datetime, argparse
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from dump495 import connect

BASELINE = "Nov 15 2026 baseline (users_baseline503): 78 accounts · 22 seen in 30 days · 8 in 7 days · 7 paying (active, not promo)"

DAYS = """SELECT day, surface, people, anons, visits FROM visit_days
          WHERE day > (now() AT TIME ZONE 'America/Chicago')::date - $1 ORDER BY day, surface"""
PEOPLE_DAYS = """SELECT n_days, count(*) people FROM (SELECT user_id, count(*) n_days FROM user_activity_days
          WHERE day > (now() AT TIME ZONE 'America/Chicago')::date - $1 GROUP BY user_id) t GROUP BY n_days ORDER BY n_days DESC"""
ANON_DAYS = """SELECT n_days, count(*) browsers FROM (SELECT anon_id, count(DISTINCT (ts AT TIME ZONE 'America/Chicago')::date) n_days
          FROM visit_events WHERE anon_id IS NOT NULL AND ts > now() - make_interval(days => $1) GROUP BY anon_id) t GROUP BY n_days ORDER BY n_days DESC"""
PER_PERSON = """SELECT coalesce(u.display_name, 'account ' || u.wordpress_user_id) who, count(*) n_days, sum(a.visits) visits,
          round(sum(a.active_seconds)/60.0) minutes,
          (SELECT count(*) FROM visit_events v WHERE v.user_id = a.user_id AND v.surface = 'walk' AND v.ts > now() - make_interval(days => $1)) walk_visits
          FROM user_activity_days a JOIN users u ON u.id = a.user_id
          WHERE a.day > (now() AT TIME ZONE 'America/Chicago')::date - $1 GROUP BY a.user_id, who ORDER BY n_days DESC, minutes DESC"""
PAGES = """SELECT surface, coalesce(book || ' ' || chapter::text, path, '(no path)') page, count(*) visits FROM visit_events
          WHERE ts > now() - make_interval(days => $1) GROUP BY 1, 2 ORDER BY visits DESC, page LIMIT 25"""
FIRST = "SELECT min(ts) AT TIME ZONE 'America/Chicago' first_at, count(*) rows, count(DISTINCT anon_id) browsers, count(DISTINCT user_id) people FROM visit_events"
FIRST_ACT = "SELECT min(day) first_day, count(DISTINCT user_id) people FROM user_activity_days"
LATEST = """SELECT ts AT TIME ZONE 'America/Chicago' at, surface, CASE WHEN user_id IS NOT NULL THEN 'signed-in' ELSE 'anon ' || left(anon_id, 8) END who,
          coalesce(book || ' ' || chapter::text, path, '') page FROM visit_events ORDER BY ts DESC LIMIT 15"""

async def main(days):
    con = await connect(); out = [f"Visits — {datetime.date.today()} (last {days} days, Central time)", f"  {BASELINE}", ""]
    try:
        a = await con.fetchrow(FIRST_ACT); e = await con.fetchrow(FIRST)
        out.append(f"  signed-in counting (user_activity_days) since {a['first_day']} — {a['people']} people ever")
        out.append(f"  raw visit log (visit_events) since {str(e['first_at'])[:16] if e['first_at'] else 'no rows yet'} — {e['rows']} rows · {e['browsers']} anonymous browsers · {e['people']} signed-in people")
        out += ["", "  == Each day · surface · signed-in people · anonymous browsers · visits =="]
        for r in await con.fetch(DAYS, days): out.append(f"    {r['day']}  {r['surface']:<4}  people={r['people']:<3} anons={r['anons']:<3} visits={r['visits']}")
        out += ["", "  == How many days each signed-in person came =="]
        for r in await con.fetch(PEOPLE_DAYS, days): out.append(f"    came {r['n_days']} day(s): {r['people']} people")
        out += ["", "  == How many days each anonymous browser came =="]
        rows = await con.fetch(ANON_DAYS, days)
        for r in rows: out.append(f"    came {r['n_days']} day(s): {r['browsers']} browsers")
        if not rows: out.append("    (none yet)")
        out += ["", "  == Per signed-in person: days · app visits · ~minutes · walk visits =="]
        for r in await con.fetch(PER_PERSON, days): out.append(f"    {r['who'][:28]:<28} {r['n_days']} day(s), {r['visits']} visit(s), ~{r['minutes']} min, walk {r['walk_visits']}")
        out += ["", "  == Pages most visited (raw log) =="]
        for r in await con.fetch(PAGES, days): out.append(f"    {r['surface']:<4} {r['page'][:50]:<50} {r['visits']}")
        out += ["", "  == Latest raw rows =="]
        for r in await con.fetch(LATEST): out.append(f"    {str(r['at'])[:16]}  {r['surface']:<4} {r['who']:<14} {r['page'][:40]}")
    finally: await con.close()
    txt = '\n'.join(out); print(txt); (W3 / 'out' / f'visits_{datetime.date.today()}.txt').write_text(txt + '\n')

ap = argparse.ArgumentParser(); ap.add_argument('--days', type=int, default=30)
asyncio.run(main(ap.parse_args().days))
