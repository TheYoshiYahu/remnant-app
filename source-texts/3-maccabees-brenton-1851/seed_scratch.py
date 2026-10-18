"""S455 scratch seed: full apocrypha-charles-vol1 edition (15 books) + pseudepigrapha edition (6 books, 1 stub verse each
except real 4-maccabees count irrelevant) + stub rows for every target the session417 cards point at."""
import json,re
U='/mnt/user-data/uploads/Desktop/App/'
def esc(s): return "E'"+s.replace('\\','\\\\').replace("'","\\'")+"'"
cv1=json.load(open(U+'source-texts/parsed/apocrypha-charles-vol1.json'))
v2=json.load(open(U+'source-texts/parsed/pseudepigrapha-charles-vol2.json'))
out=["BEGIN;",
"INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ('apocrypha-charles-vol1','The Apocrypha (Charles 1913) — Restored Names Edition','Charles 1913 vol 1','phase4-v2'),('pseudepigrapha','The Pseudepigrapha (Charles 1913) — Restored Names Edition','Charles 1913 vol 2','phase4-v2'),('canon','Canon','KJV','phase4-v2'),('apocrypha','Apocrypha','KJV 1611','phase4-v2'),('other','Other','x','phase4-v2');"]
def book(ed,slug,title,order,wc,tier): out.append(f"INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) SELECT id,'{slug}',{esc(title)},{order},'{wc}','{tier}' FROM editions WHERE slug='{ed}';")
def chap(ed,slug,n,title=None,intro=None): out.append(f"INSERT INTO chapters (book_id,chapter_number,chapter_title,chapter_intro) SELECT b.id,{n},{esc(title) if title else 'NULL'},{esc(intro) if intro else 'NULL'} FROM books b JOIN editions e ON e.id=b.edition_id AND e.slug='{ed}' WHERE b.slug='{slug}';")
def verse(ed,slug,c,v,t): out.append(f"INSERT INTO verses (chapter_id,verse_number,text) SELECT c.id,{v},{esc(t)} FROM chapters c JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id AND e.slug='{ed}' WHERE b.slug='{slug}' AND c.chapter_number={c} ON CONFLICT DO NOTHING;")
for i,b in enumerate(cv1['books'],1):
    book('apocrypha-charles-vol1',b['book_id'],b['book_title'],220+i,'apocrypha','extras')
    for c in b['chapters']:
        chap('apocrypha-charles-vol1',b['book_id'],c['number'],c.get('title'),c.get('commentary'))
        for v in c['verses']: verse('apocrypha-charles-vol1',b['book_id'],c['number'],v['number'],v['text'])
for i,b in enumerate(v2['books'],1):
    book('pseudepigrapha',b['book_id'],b['book_title'],360+i,'pseudepigrapha','extras')
    chap('pseudepigrapha',b['book_id'],1); verse('pseudepigrapha',b['book_id'],1,1,'stub')
# targets from session417
sql=open(U+'data-schema/migrations/session417_3maccabees_extracanon_cross_references.sql').read()
tups=re.findall(r"\('([^']+)', '([^']+)', (\d+), (\d+), '([^']+)', '([^']+)', (\d+), (\d+), '(free|extras)'",sql)
targets=set()
for se,ss,sc,sv,te,ts,tc,tv,_ in tups:
    for e,s,c,v in ((se,ss,sc,sv),(te,ts,tc,tv)):
        if e!='apocrypha-charles-vol1': targets.add((e,s,int(c),int(v)))
eds={e for e,_,_,_ in targets}
for e in eds:
    if e not in ('canon','apocrypha','pseudepigrapha'): out.append(f"INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ('{e}','{e}','x','phase4-v2') ON CONFLICT DO NOTHING;")
bks=sorted({(e,s) for e,s,_,_ in targets}); 
for i,(e,s) in enumerate(bks):
    if e=='pseudepigrapha' and s in [b['book_id'] for b in v2['books']]: continue
    book(e,s,s,1000+i,'canon','free')
for e,s,c in sorted({(e,s,c) for e,s,c,_ in targets}):
    if e=='pseudepigrapha' and c==1: continue
    chap(e,s,c)
for e,s,c,v in sorted(targets): verse(e,s,c,v,'stub')
out.append("COMMIT;")
open('seed_scratch.sql','w').write('\n'.join(out)); print(len(out),'statements;',len(tups),'card tuples;',len(targets),'targets;',sorted(eds))
