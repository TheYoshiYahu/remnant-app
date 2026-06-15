"""Transactional 2-Baruch (book 787) text repair WITH inbound-xref content-remap.
FK cross_references.(source|target)_verse_id is ON DELETE RESTRICT, so the 6 inbound
xrefs must be repointed within the same tx: placeholder -> delete -> insert -> final repoint.
Usage: python3 apply_2baruch.py <restored.json>"""
import asyncio, ssl, sys, json, time
from pathlib import Path
import asyncpg

RESTORED = sys.argv[1]
BOOK_ID = 787

# content-verified remaps: xref_id -> (new_chapter, new_verse)
REMAP = {4869:(6,7), 4884:(51,7), 4427:(70,2), 4428:(70,2), 4431:(78,3), 4432:(78,7)}
# thread title corrections (scrambled old chapter nums -> true chapters)
TITLE_FIX = {
 103: ("2 Baruch 35:1", "2 Baruch 70:2"),
 105: ("2 Baruch 38", "2 Baruch 78"),
}

def url():
    v=[l for l in Path('/Users/mtm/Desktop/App/api/.env').read_text().splitlines() if l.startswith('DATABASE_URL=')][0].split('=',1)[1].strip().strip('"').strip("'")
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
    bk=await c.fetchrow("select b.id,b.slug,b.title,e.slug ed from books b join editions e on b.edition_id=e.id where b.id=$1",BOOK_ID)
    print(f"BOOK {bk['id']} {bk['ed']}::{bk['slug']} '{bk['title']}'")
    cur_v=await c.fetchval("select count(*) from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1",BOOK_ID)
    cur_c=await c.fetchval("select count(*) from chapters where book_id=$1",BOOK_ID)
    print(f"CURRENT: {cur_c} ch / {cur_v} v  -> NEW: {exp_ch} ch / {exp_v} v")

    # inbound xref sanity
    inb=await c.fetch("""select x.id, ch.chapter_number tch, v.verse_number tv
        from cross_references x join verses v on x.target_verse_id=v.id join chapters ch on v.chapter_id=ch.id
        where ch.book_id=$1 order by ch.chapter_number,v.verse_number""",BOOK_ID)
    print("INBOUND xref rows:", [(r['id'],r['tch'],r['tv']) for r in inb])
    assert set(r['id'] for r in inb)==set(REMAP), f"inbound set {set(r['id'] for r in inb)} != REMAP keys {set(REMAP)}"

    # BACKUP text + xref mapping
    Path('/tmp/repair3-wt/scratch_repair/backup').mkdir(parents=True,exist_ok=True)
    rows=await c.fetch("""select ch.chapter_number,ch.chapter_title,v.verse_number,v.text
        from chapters ch left join verses v on v.chapter_id=ch.id where ch.book_id=$1 order by ch.chapter_number,v.verse_number""",BOOK_ID)
    bset={}
    for r in rows:
        bset.setdefault(r['chapter_number'],{'title':r['chapter_title'],'verses':[]})
        if r['verse_number'] is not None: bset[r['chapter_number']]['verses'].append({'n':r['verse_number'],'text':r['text']})
    ts=int(time.time())
    bpath=f"/tmp/repair3-wt/scratch_repair/backup/book{BOOK_ID}_{ts}.json"
    json.dump({'book_id':BOOK_ID,'slug':bk['slug'],'chapters':bset,
               'inbound_xrefs':[(r['id'],r['tch'],r['tv']) for r in inb]},open(bpath,'w'),ensure_ascii=False,indent=1)
    print(f"BACKUP -> {bpath} ({len(bset)} ch)")

    # distinct placeholder verse id per xref (NOT in 787, survive the delete; avoids the
    # (source_verse_id,target_verse_id,source) unique-constraint collision when xrefs share a source)
    phrows=await c.fetch("select v.id from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id<>$1 order by v.id limit 50",BOOK_ID)
    phlist=[r['id'] for r in phrows]
    phmap={xid:phlist[i] for i,xid in enumerate(REMAP)}
    print("placeholder map:",phmap)

    async with c.transaction():
        # a) free the RESTRICT (each xref to its own placeholder)
        for xid,ph in phmap.items():
            await c.execute("update cross_references set target_verse_id=$1 where id=$2",ph,xid)
        # b) delete old
        await c.execute("delete from chapters where book_id=$1",BOOK_ID)
        # c) insert new, build (ch,v)->id
        idmap={}
        for ch in d["chapters"]:
            cid=await c.fetchval("insert into chapters(book_id,chapter_number,chapter_title) values($1,$2,$3) returning id",
                BOOK_ID,ch["n"],(ch.get("title") or None))
            for v in ch["verses"]:
                vid=await c.fetchval("insert into verses(chapter_id,verse_number,text) values($1,$2,$3) returning id",cid,v["n"],v["text"])
                idmap[(ch["n"],v["n"])]=vid
        nc=await c.fetchval("select count(*) from chapters where book_id=$1",BOOK_ID)
        nv=await c.fetchval("select count(*) from verses v join chapters ch on v.chapter_id=ch.id where ch.book_id=$1",BOOK_ID)
        assert nc==exp_ch and nv==exp_v, f"COUNT MISMATCH nc={nc}/{exp_ch} nv={nv}/{exp_v}"
        # d) final repoint
        for xid,(nch,nv2) in REMAP.items():
            tgt=idmap.get((nch,nv2))
            assert tgt, f"remap target {nch}:{nv2} missing for xref {xid}"
            await c.execute("update cross_references set target_verse_id=$1 where id=$2",tgt,xid)
        # e) thread title fixes
        for thid,(old,new) in TITLE_FIX.items():
            cur=await c.fetchval("select title from cross_reference_threads where id=$1",thid)
            if cur and old in cur:
                await c.execute("update cross_reference_threads set title=replace(title,$1,$2) where id=$3",old,new,thid)
                print(f"  thread {thid} title: {old!r} -> {new!r}")
            else:
                print(f"  WARN thread {thid} title did not contain {old!r}: {cur!r}")
        # f) verify no placeholder leftover + all into 787
        left=await c.fetchval("select count(*) from cross_references where id=any($1::int[]) and target_verse_id=any($2::int[])",list(REMAP),list(phmap.values()))
        assert left==0, f"{left} xrefs still on placeholder"
        bad=await c.fetchval("""select count(*) from cross_references x
            join verses v on x.target_verse_id=v.id join chapters ch on v.chapter_id=ch.id
            where x.id=any($1::int[]) and ch.book_id<>$2""",list(REMAP),BOOK_ID)
        assert bad==0, f"{bad} remapped xrefs not in book 787"
        print(f"INSERTED {nc} ch / {nv} v ✓ ; 6 inbound xrefs remapped ✓ -> COMMIT")

    # readback
    for (ch,vn) in [(1,1),(12,1),(12,5),(86,1),(87,1)]:
        r=await c.fetchrow("select v.text from verses v join chapters c2 on v.chapter_id=c2.id where c2.book_id=$1 and c2.chapter_number=$2 and v.verse_number=$3",BOOK_ID,ch,vn)
        print(f"  readback {ch}:{vn}: {(r['text'][:90] if r else 'MISSING')}")
    # verify remaps resolved to right (ch,v)
    chk=await c.fetch("""select x.id, ch.chapter_number tch, v.verse_number tv from cross_references x
        join verses v on x.target_verse_id=v.id join chapters ch on v.chapter_id=ch.id
        where x.id=any($1::int[]) order by x.id""",list(REMAP))
    print("  remapped now:", [(r['id'],r['tch'],r['tv']) for r in chk])
    await c.close()
asyncio.run(main())
