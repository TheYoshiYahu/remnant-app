import json,sys,re
raw=open(sys.argv[2]).read().lower()
rawwords=set(re.findall(r"[a-z]+",raw))
data=json.load(open(sys.argv[1]))
# words we allow even if not in raw (common OCR corrections / joins)
ALLOW=set("the and god lord baruch angel heaven".split())
miss={}
nv=0
for ch in data["chapters"]:
    for v in ch["verses"]:
        nv+=1
        for w in re.findall(r"[a-z]{4,}",v["text"].lower()):
            if w in rawwords or w in ALLOW: continue
            # allow singular/plural/verb morphology vs raw
            if any(w[:-1] in rawwords or w+'s' in rawwords or w[:-2] in rawwords for _ in [0]): continue
            miss.setdefault(f'{ch["n"]}:{v["n"]}',[]).append(w)
print(f"verses={nv} chapters={len(data['chapters'])}")
print(f"verses-with-unverified-words: {len(miss)}")
tot=sum(len(x) for x in miss.values())
print(f"total unverified word-tokens: {tot}")
for k in list(miss)[:40]:
    print(f"  {k}: {miss[k]}")
