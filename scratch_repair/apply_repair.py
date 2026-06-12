"""Transactional repair-apply for Track B. Runs ONLY when DB reachable.
Usage: python3 apply_repair.py <restored.json> <book_id> [--allow-inbound]
Safety: aborts if inbound cross_references target this book unless --allow-inbound.
Backs up current chapters+verses to scratch_repair/backup/ before any change."""
import asyncio, ssl, sys, json, os, time
from pathlib import Path
import asyncpg
RESTORED, BOOK_ID = sys.argv[1], int(sys.argv[2])
ALLOW_INBOUND = "--allow-inbound" in sys.argv
def url():
    v=[l for l in Path('/tmp/repair-wt/api/.env').read_text().splitlines() if l.startswith('DATABASE_URL=')][0].split('=',1)[1].strip().strip('"').strip("'")
    return v + (('&' if '?' in v else '?')+'sslmode=require' if 'sslmode' not in v else '')
async def conn():
    c=ssl.create_default_context(); c.check_hostname=False; c.verify_mode=ssl.CERT_NONE
    last=None
    for _ in range(8):
        try: return await asyncpg.connect(url(), ssl=c, timeout=30)
        except Exception as e: last=e; await asyncio.sleep(5)
    raise last
async def main():
    d=json.load(open(RESTORED))
    exp_ch=len(d["chapters"]); exp_v=sum(len(c["verses"]) for c in d["chapters"])
    c=await conn()
    # identity
    bk=await c.fetchrow("select b.id,b.slug,b.title,e.slug ed from books b join editions e on b.edition_id=e.id where b.id=$1",BOOK_ID)
    print(f"BOOK {bk['id']} {bk['ed']}::{bk['slug']} '{bk['title']}'")
    cur_v=await c.fetchval("select count(*) from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1",BOOK_ID)
    cur_c=await c.fetchval("select count(*) from chapters where book_id=$1",BOOK_ID)
    print(f"CURRENT: {cur_c} chapters / {cur_v} verses  -> NEW: {exp_ch} chapters / {exp_v} verses")
    # SAFETY: inbound xrefs
    inbound=await c.fetchval("""select count(*) from cross_references x
        where x.target_verse_id in (select v.id from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1)""",BOOK_ID)
    # source-side too (members whose source is in this book)
    src_in=await c.fetchval("""select count(*) from cross_references x
        where x.source_verse_id in (select v.id from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1)""",BOOK_ID)
    print(f"INBOUND xref rows (target in book)={inbound}  SOURCE-in-book rows={src_in}")
    if (inbound or src_in) and not ALLOW_INBOUND:
        print("ABORT: book is xref-coupled; rerun with --allow-inbound after planning remap."); await c.close(); return
    # BACKUP
    Path('/tmp/repair-wt/scratch_repair/backup').mkdir(parents=True,exist_ok=True)
    rows=await c.fetch("""select ch.chapter_number,ch.chapter_title,ch.chapter_intro,v.verse_number,v.text
        from chapters ch left join verses v on v.chapter_id=ch.id where ch.book_id=$1 order by ch.chapter_number,v.verse_number""",BOOK_ID)
    bset={}
    for r in rows:
        bset.setdefault(r['chapter_number'],{'title':r['chapter_title'],'intro':r['chapter_intro'],'verses':[]})
        if r['verse_number'] is not None: bset[r['chapter_number']]['verses'].append({'n':r['verse_number'],'text':r['text']})
    bpath=f"/tmp/repair-wt/scratch_repair/backup/book{BOOK_ID}_{int(time.time())}.json"
    json.dump({'book_id':BOOK_ID,'slug':bk['slug'],'chapters':bset},open(bpath,'w'),ensure_ascii=False,indent=1)
    print(f"BACKUP -> {bpath} ({len(bset)} ch)")
    # APPLY in one tx
    async with c.transaction():
        await c.execute("delete from chapters where book_id=$1",BOOK_ID)  # cascades verses
        for ch in d["chapters"]:
            cid=await c.fetchval("insert into chapters(book_id,chapter_number,chapter_title) values($1,$2,$3) returning id",
                BOOK_ID,ch["n"],(ch.get("title") or None))
            for v in ch["verses"]:
                await c.execute("insert into verses(chapter_id,verse_number,text) values($1,$2,$3)",cid,v["n"],v["text"])
        nc=await c.fetchval("select count(*) from chapters where book_id=$1",BOOK_ID)
        nv=await c.fetchval("select count(*) from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1",BOOK_ID)
        assert nc==exp_ch and nv==exp_v, f"COUNT MISMATCH nc={nc}/{exp_ch} nv={nv}/{exp_v} -> ROLLBACK"
        print(f"INSERTED {nc} chapters / {nv} verses  ✓ counts match -> COMMIT")
    # readback
    s=await c.fetch("select v.verse_number,v.text from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1 and ch.chapter_number=1 order by v.verse_number limit 2",BOOK_ID)
    for r in s: print(f"  readback 1:{r['verse_number']}: {r['text'][:80]}")
    await c.close()
asyncio.run(main())
