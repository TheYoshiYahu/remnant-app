import json,sys
ch=int(sys.argv[1]); book=sys.argv[2] if len(sys.argv)>2 else 'matthew'; pk=json.load(open(f'packets/{book}_{ch}.json')); 
import os
p=f'out/{book}_{ch}_fixed.json' if os.path.exists(f'out/{book}_{ch}_fixed.json') else f'out/{book}_{ch}_draft.json'
dr=json.load(open(p)); P={c['id']:c for c in pk['cards']}
print('MODEL',dr['model'],p)
for c in dr['cards']:
    k=P[c['id']]
    print(f"\n[{c['id']}] {k['src']} -> {k['tgt']}   thread: {c['thread'][:60]}  (map: {(k.get('map_thread') or '-')[:40]} {k.get('map_confidence')} | hint: {k.get('author_thread_hint')})")
    print('  M:',k['src_text_kjv']); print('  T:',k['tgt_text_kjv']); print('  OLD:',k['old_note'])
    print('  NEW:',c['prose']); print('  MEM:',c['member_phrase'][:80],'|',c['member_sentence'])
    if c.get('flag'): print('  FLAG:',c['flag'])
for t in dr.get('new_threads') or []: print('\nNEW THREAD',json.dumps(t,ensure_ascii=False,indent=1))
