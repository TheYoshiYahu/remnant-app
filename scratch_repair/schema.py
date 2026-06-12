import asyncio, importlib.util
spec=importlib.util.spec_from_file_location("db","/tmp/extracanon2-wt/scratch_extracanon2/db.py")
db=importlib.util.module_from_spec(spec); spec.loader.exec_module(db)
async def conn():
    last=None
    for _ in range(5):
        try: return await db.connect()
        except Exception as e:
            last=e; await asyncio.sleep(3)
    raise last
async def main():
    c=await conn()
    for t in ('chapters','verses'):
        print(f"=== {t} ===")
        rows=await c.fetch("select column_name,data_type,is_nullable from information_schema.columns where table_name=$1 order by ordinal_position",t)
        for r in rows: print(f"  {r['column_name']:22s} {r['data_type']:10s} null={r['is_nullable']}")
    print("=== 3-baruch chapters (book_id 788) ===")
    rows=await c.fetch("select id,chapter_number,chapter_title from chapters where book_id=788 order by chapter_number")
    for r in rows: print(f"  ch{r['chapter_number']} id={r['id']} '{(r['chapter_title'] or '')[:55]}'")
    print("=== verses ch1 ===")
    rows=await c.fetch("select v.id,v.verse_number,v.text from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=788 and ch.chapter_number=1 order by v.verse_number")
    for r in rows: print(f"  v{r['verse_number']} id={r['id']}: {r['text'][:85]}")
    await c.close()
asyncio.run(main())
