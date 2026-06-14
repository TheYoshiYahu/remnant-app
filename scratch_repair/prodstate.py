import asyncio, sys
sys.path.insert(0,'scratch_repair')
import importlib.util
spec=importlib.util.spec_from_file_location("db","/tmp/extracanon2-wt/scratch_extracanon2/db.py")
db=importlib.util.module_from_spec(spec); spec.loader.exec_module(db)
SLUGS=['2-enoch','3-baruch','adam-eve','4-maccabees','2-baruch','testaments-xii']
async def main():
    c=await db.connect()
    # find edition id for pseudepigrapha
    eds=await c.fetch("select id,slug,title from editions where slug ilike '%pseudep%' or slug='pseudepigrapha'")
    print("EDITIONS:",[(e['id'],e['slug']) for e in eds])
    for slug in SLUGS:
        rows=await c.fetch("""select b.id,b.slug,b.title,b.edition_id,e.slug as ed,
          (select count(*) from chapters ch where ch.book_id=b.id) nch,
          (select count(*) from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=b.id) nv
          from books b join editions e on b.edition_id=e.id
          where b.slug=$1""",slug)
        for r in rows:
            print(f"  {r['ed']:18s} {r['slug']:16s} book_id={r['id']} ch={r['nch']} verses={r['nv']}  '{r['title'][:40]}'")
    await c.close()
asyncio.run(main())
