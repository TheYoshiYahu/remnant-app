import json,sys
sys.path.insert(0,'restoration-pipeline')
from restore import Restorer
r=Restorer()
src=sys.argv[1]; out=sys.argv[2]
d=json.load(open(src))
n=0
for ch in d["chapters"]:
    for v in ch["verses"]:
        v["text"]=r.restore_text(v["text"]); n+=1
json.dump(d,open(out,"w"),ensure_ascii=False,indent=1)
print(f"restored {n} verses -> {out}")
