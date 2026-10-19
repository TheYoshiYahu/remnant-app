import asyncio, asyncpg, sys, re
sql = open('session459_enoch_card_fix.sql').read()
sql = '\n'.join(l for l in sql.split('\n') if not l.lstrip().startswith('\\'))
async def main():
    con = await asyncpg.connect(host='/tmp', port=5499, user='postgres', database='postgres')
    notices = []
    con.add_log_listener(lambda c, m: notices.append(m.message))
    await con.execute(sql)
    for n in notices:
        if 'summary' in n or 'SKIPPED' in n or 'absent' in n or 'expected' in n or 'read the' in n: print(n)
    print('moved notices:', sum(1 for n in notices if 'moved card' in n))
    await con.close()
asyncio.run(main())
