import json,sys
d=json.load(open(sys.argv[1])); book_id=int(sys.argv[2]); slug=d.get("book","?")
def q(s): return "'"+s.replace("'","''")+"'"
out=[]
out.append(f"-- Track B repair migration: {slug} (book_id {book_id})")
out.append("-- Source: R.H. Charles 1913 APOT vol.2 (Internet Archive scan apocryphapseudep02charuoft),")
out.append("-- apparatus-stripped, OCR-corrected, fidelity-gated (0 unverified word-tokens), sacred-names restored.")
out.append("BEGIN;")
out.append(f"DELETE FROM chapters WHERE book_id = {book_id};  -- cascades verses")
# chapters
vals=[]
for ch in d["chapters"]:
    t = q(ch["title"]) if ch.get("title") else "NULL"
    vals.append(f"({book_id},{ch['n']},{t})")
out.append("INSERT INTO chapters (book_id, chapter_number, chapter_title) VALUES")
out.append(",\n".join(vals)+";")
# verses via join on chapter_number
out.append("INSERT INTO verses (chapter_id, verse_number, text)")
out.append("SELECT ch.id, d.vn, d.txt FROM chapters ch JOIN (VALUES")
vv=[]
for ch in d["chapters"]:
    for v in ch["verses"]:
        vv.append(f"({ch['n']},{v['n']},{q(v['text'])})")
out.append(",\n".join(vv))
out.append(f") AS d(cn,vn,txt) ON ch.book_id={book_id} AND ch.chapter_number=d.cn;")
# verify
nch=len(d["chapters"]); nv=sum(len(c["verses"]) for c in d["chapters"])
out.append("DO $$ DECLARE c int; v int; BEGIN")
out.append(f"  SELECT count(*) INTO c FROM chapters WHERE book_id={book_id};")
out.append(f"  SELECT count(*) INTO v FROM verses vs JOIN chapters ch ON vs.chapter_id=ch.id WHERE ch.book_id={book_id};")
out.append(f"  IF c<>{nch} OR v<>{nv} THEN RAISE EXCEPTION 'count mismatch c=% (exp {nch}) v=% (exp {nv})',c,v; END IF;")
out.append("END $$;")
out.append("COMMIT;")
open(sys.argv[3],"w").write("\n".join(out)+"\n")
print(f"wrote {sys.argv[3]}: {nch} chapters / {nv} verses")
