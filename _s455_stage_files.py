"""S455 — retire apocrypha-charles-vol1 in the FILES (DB is session455_retire_charles_vol1.sql).
Every edit is counted and asserted. Backups of the two edition JSONs as .pre-s455. Safe to re-run (each step checks first)."""
import json,os,re,shutil,sys
os.chdir(os.path.dirname(os.path.abspath(__file__)))
P='source-texts/parsed/'; CV1=P+'apocrypha-charles-vol1.json'; V2=P+'pseudepigrapha-charles-vol2.json'
RET='source-texts/apocrypha-charles-vol1/apocrypha-charles-vol1.parsed-retired-s455.json'
def bak(f):
    if not os.path.exists(f+'.pre-s455'): shutil.copy(f,f+'.pre-s455')
# 1. 3 Maccabees into the vol-2 JSON, before 4 Maccabees; retired JSON moves beside its OCR source
v2=json.load(open(V2))
if not any(b['book_id']=='3-maccabees' for b in v2['books']):
    src=json.load(open(CV1)) if os.path.exists(CV1) else json.load(open(RET))
    m3=[b for b in src['books'] if b['book_id']=='3-maccabees'][0]
    n=sum(len(c['verses']) for c in m3['chapters']); assert (len(m3['chapters']),n)==(7,228),(len(m3['chapters']),n)
    i=[b['book_id'] for b in v2['books']].index('4-maccabees'); v2['books'].insert(i,m3)
    bak(V2); json.dump(v2,open(V2,'w'),ensure_ascii=False,indent=1)
    print('vol2 JSON: 3-maccabees inserted before 4-maccabees ->',[b['book_id'] for b in v2['books']])
else: print('vol2 JSON already has 3-maccabees')
if os.path.exists(CV1): shutil.move(CV1,RET); print('retired parsed JSON moved to',RET)
# 2. seed.py — drop the edition profile + JSON map line; note the move
s=open('api/seed.py').read()
if '"apocrypha-charles-vol1": {' in s:
    a=s.index('    # Apocrypha (Charles 1913 vol 1) — W-2 wire-up landed session 27,'); b=s.index('    # 2026-05-12. NEW edition `mrjames-apocryphal-nt`')
    assert 0<a<b and s.count('"apocrypha-charles-vol1": {')==1
    s=s[:a]+('    # `apocrypha-charles-vol1` (Charles 1913 vol 1, tesseract OCR) was RETIRED in S455\n'
             '    # (2026-10-17): 37% of verse numbers absent, 36% of rows OCR garbage (S454 audit).\n'
             '    # Its one clean book, 3 Maccabees (= Brenton 1851 text, verified by content S455),\n'
             '    # now lives in the `pseudepigrapha` edition before 4 Maccabees. Live DB:\n'
             '    # data-schema/migrations/session455_retire_charles_vol1.sql (ids unchanged).\n')+s[b:]
    s=s.replace('    "apocrypha-charles-vol1": "apocrypha-charles-vol1.json",\n','',1)
    s=s.replace('    #   6. 4-maccabees      (4 Maccabees)\n','    #   6. 3-maccabees      (3 Maccabees — moved here S455 from the retired Charles vol 1 edition)\n    #   7. 4-maccabees      (4 Maccabees)\n',1)
    assert 'apocrypha-charles-vol1.json' not in s and s.count('apocrypha-charles-vol1')>=2
    open('api/seed.py','w').write(s); print('seed.py: profile + JSON map removed')
else: print('seed.py already edited')
# 3. chronological reading (data + builder), paragraph starts
f='app/src/data/chronological-reading.json'; d=json.load(open(f)); n=0
for e in d['entries']:
    if e.get('edition_id')=='apocrypha-charles-vol1': assert e['book_id']=='3-maccabees'; e['edition_id']='pseudepigrapha'; n+=1
if n: json.dump(d,open(f,'w'),ensure_ascii=False,indent=1); print('chronological-reading.json: edition rekeyed on',n,'entries (expect 7)')
f='_s211_build_chronological_order.py'; s=open(f).read()
if '("apocrypha-charles-vol1", "3-maccabees"' in s: open(f,'w').write(s.replace('("apocrypha-charles-vol1", "3-maccabees"','("pseudepigrapha", "3-maccabees"')); print('_s211 builder rekeyed')
f='app/src/data/paragraph_starts.json'; d=json.load(open(f))
if 'apocrypha-charles-vol1::3-maccabees' in d:
    d['pseudepigrapha::3-maccabees']=d.pop('apocrypha-charles-vol1::3-maccabees')
    gone=[k for k in d if k.startswith('apocrypha-charles-vol1::')]; assert len(gone)==14,gone
    for k in gone: del d[k]
    json.dump(d,open(f,'w'),ensure_ascii=False,separators=(',',':')); print('paragraph_starts.json: 3-maccabees rekeyed, 14 charles-vol1 keys dropped')
# 4. tts/chapters_all.json + audio folders + timing jsons
f='tts/chapters_all.json'; chs=json.load(open(f))
if any(c['book'].startswith('apocrypha-charles-vol1/') for c in chs):
    bak(f); keep=[]; dropped=0
    for c in chs:
        if c['book']=='apocrypha-charles-vol1/3-maccabees': c['book']='pseudepigrapha/3-maccabees'
        elif c['book'].startswith('apocrypha-charles-vol1/'): dropped+=1; continue
        keep.append(c)
    assert dropped==153 and sum(c['book']=='pseudepigrapha/3-maccabees' for c in keep)==7,(dropped)
    json.dump(keep,open(f,'w'),ensure_ascii=False); print('chapters_all.json: 7 rekeyed, 153 dropped ->',len(keep),'chapters')
old='audio/am_michael/apocrypha-charles-vol1'; new='audio/am_michael/pseudepigrapha/3-maccabees'; arch='audio/_archive/am_michael/apocrypha-charles-vol1'
if os.path.isdir(old+'/3-maccabees'):
    assert not os.path.exists(new); shutil.move(old+'/3-maccabees',new); print('audio: 3-maccabees moved to',new,len(os.listdir(new)),'files (expect 14)')
if os.path.isdir(old):
    os.makedirs(os.path.dirname(arch),exist_ok=True); shutil.move(old,arch); print('audio: other charles-vol1 books archived to',arch)
if os.path.isdir(new):
    for fn in os.listdir(new):
        if fn.endswith('.json'):
            t=json.load(open(f'{new}/{fn}'))
            if t.get('book')!='pseudepigrapha/3-maccabees': t['book']='pseudepigrapha/3-maccabees'; json.dump(t,open(f'{new}/{fn}','w'))
# 5. reader / prerender comments (the filter stays as a harmless fallback for a book the FK scan kept)
for f,old_,new_ in [('app/src/App.tsx','// S232 — apocrypha de-duplication. Two apocrypha editions are live:','// S455 — the `apocrypha-charles-vol1` edition was RETIRED (OCR text) and its one clean\n// book, 3 Maccabees, moved into `pseudepigrapha`; this filter now only matters if the\n// S455 FK scan KEPT a referenced Charles-vol1 book in the DB.\n// S232 — apocrypha de-duplication. Two apocrypha editions were live:'),
                    ('app/scripts/prerender-library.mjs','// Same display filters as the reader (app/src/App.tsx): the Charles-vol1','// Same display filters as the reader (app/src/App.tsx): the (retired, S455) Charles-vol1')]:
    s=open(f).read()
    if old_ in s and new_ not in s: open(f,'w').write(s.replace(old_,new_,1)); print(f,'comment updated')
print('S455 file staging complete')
