"""Seed the scratch DB with the OLD Jubilees (app_jubilees.json) + every local card touching Jubilees (+ stub rows for their other ends)."""
import json
def esc(s): return "E'"+s.replace('\\','\\\\').replace("'","\\'")+"'"
app=json.load(open('app_jubilees.json'))
cards=json.load(open('jub_cards_local.json'))
seen={(r['ss'],r['sc'],r['sv'],r['ts'],r['tc'],r['tv']):r for r in cards}; cards=list(seen.values())
out=["BEGIN;","INSERT INTO editions (slug,title,public_domain_base,restoration_pipeline_version) VALUES ('jubilees','Jubilees','Charles','phase4-v2'),('canon','Canon','KJV','phase4-v2'),('other','Other','x','phase4-v2');",
"INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) SELECT id,'jubilees','The Book of Jubilees',310,'pseudepigrapha','extras' FROM editions WHERE slug='jubilees';"]
for c in app['books'][0]['chapters']:
    out.append(f"INSERT INTO chapters (book_id,chapter_number,chapter_title,chapter_intro) SELECT b.id,{c['number']},{esc(c['title'] or '')},{esc(c['commentary'] or '')} FROM books b JOIN editions e ON e.id=b.edition_id AND e.slug='jubilees' WHERE b.slug='jubilees';")
    for v in c['verses']:
        out.append(f"INSERT INTO verses (chapter_id,verse_number,text) SELECT c.id,{v['number']},{esc(v['text'])} FROM chapters c JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id AND e.slug='jubilees' WHERE b.slug='jubilees' AND c.chapter_number={c['number']};")
# other ends
others=set()
for r in cards:
    for side in 'st':
        if r[side+'s']!='jubilees': others.add((r[side+'e'],r[side+'s'],r[side+'c'],r[side+'v']))
books={(e,s) for e,s,_,_ in others}; chs={(e,s,c) for e,s,c,_ in others}
for i,(e,s) in enumerate(sorted(books)):
    ed='canon' if e=='canon' else 'other'
    out.append(f"INSERT INTO books (edition_id,slug,title,canonical_order,witness_category,tier_required) SELECT id,'{s}','{s}',{1000+i},'canon','free' FROM editions WHERE slug='{ed}';")
for e,s,c in sorted(chs):
    ed='canon' if e=='canon' else 'other'
    out.append(f"INSERT INTO chapters (book_id,chapter_number) SELECT b.id,{c} FROM books b JOIN editions ed ON ed.id=b.edition_id AND ed.slug='{ed}' WHERE b.slug='{s}';")
for e,s,c,v in sorted(others):
    ed='canon' if e=='canon' else 'other'
    out.append(f"INSERT INTO verses (chapter_id,verse_number,text) SELECT c.id,{v},'stub' FROM chapters c JOIN books b ON b.id=c.book_id JOIN editions ed ON ed.id=b.edition_id AND ed.slug='{ed}' WHERE b.slug='{s}' AND c.chapter_number={c};")
out.append("CREATE TEMP VIEW vv AS SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn FROM verses v JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;")
skipped=0
for r in cards:
    se='jubilees' if r['ss']=='jubilees' else ('canon' if r['se']=='canon' else 'other')
    te='jubilees' if r['ts']=='jubilees' else ('canon' if r['te']=='canon' else 'other')
    out.append(f"INSERT INTO cross_references (source_verse_id,target_verse_id,source,note,tier_required) SELECT s.id,t.id,'seed',{esc(r['note'].replace(chr(39)*2,chr(39)))},'free' FROM vv s, vv t WHERE s.es='{se}' AND s.bs='{r['ss']}' AND s.ch={r['sc']} AND s.vn={r['sv']} AND t.es='{te}' AND t.bs='{r['ts']}' AND t.ch={r['tc']} AND t.vn={r['tv']} ON CONFLICT DO NOTHING;")
out.append("COMMIT;")
open('seed_scratch.sql','w').write('\n'.join(out)); print(len(out),'statements;',len(cards),'cards')
