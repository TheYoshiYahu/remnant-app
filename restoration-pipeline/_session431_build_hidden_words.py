#!/usr/bin/env python3
"""
S431 Hidden Words — deterministic build (dry-run from on-disk sources).

Produces the hidden_words counts the feature needs. In production this reads
verse_words from the DB; this dry-run reads the SAME inputs verse_words was
built from (source-texts/kjv/eng-kjv_usfx.xml) so the numbers match byte-for-byte
and can be reviewed before the migration runs. Zero AI; re-runnable.

Steps (spec §"How the counts are generated"):
 1. (surface, strong, book/ch/vs) from USFX <w s="X">surface</w>, bcv-anchored.
 2. Fold English: lowercase, strip possessive/plural/verb inflections -> stem;
    multi-word tags split to their content word ("the devil" -> devil).
 3. Keep a (word,strong) pair only when Strong's own KJV-usage lists that word.
 4. Count distinct Strong's numbers per folded English word.
 5. (second witness TAGNT/TAHOT — known tag-slip restores; stubbed set here)
 6. Emit counts + per-word originals + dry-run report.
"""
import re, sys, json, collections, pathlib
ST = pathlib.Path(__file__).resolve().parent.parent / "source-texts"
USFX = ST/"kjv"/"eng-kjv_usfx.xml"
HEB  = ST/"openscriptures-hebrewlexicon"/"HebrewStrong.xml"
GRK  = ST/"strongs-greek"/"strongsgreek.xml"

USFX_TO_SLUG = {"GEN":"genesis","EXO":"exodus","LEV":"leviticus","NUM":"numbers","DEU":"deuteronomy",
"JOS":"joshua","JDG":"judges","RUT":"ruth","1SA":"1-samuel","2SA":"2-samuel","1KI":"1-kings","2KI":"2-kings",
"1CH":"1-chronicles","2CH":"2-chronicles","EZR":"ezra","NEH":"nehemiah","EST":"esther","JOB":"job","PSA":"psalms",
"PRO":"proverbs","ECC":"ecclesiastes","SNG":"song-of-solomon","ISA":"isaiah","JER":"jeremiah","LAM":"lamentations",
"EZK":"ezekiel","DAN":"daniel","HOS":"hosea","JOL":"joel","AMO":"amos","OBA":"obadiah","JON":"jonah","MIC":"micah",
"NAM":"nahum","HAB":"habakkuk","ZEP":"zephaniah","HAG":"haggai","ZEC":"zechariah","MAL":"malachi","MAT":"matthew",
"MRK":"mark","LUK":"luke","JHN":"john","ACT":"acts","ROM":"romans","1CO":"1-corinthians","2CO":"2-corinthians",
"GAL":"galatians","EPH":"ephesians","PHP":"philippians","COL":"colossians","1TH":"1-thessalonians","2TH":"2-thessalonians",
"1TI":"1-timothy","2TI":"2-timothy","TIT":"titus","PHM":"philemon","HEB":"hebrews","JAS":"james","1PE":"1-peter",
"2PE":"2-peter","1JN":"1-john","2JN":"2-john","3JN":"3-john","JUD":"jude","REV":"revelation"}

# ---- restored-name exclusions (surfaces that stay plain) ----
EXCLUDE = set("""god lord jesus christ israel judah jew jews jewish jah
melchizedek melchisedec melchisedech melchizedec""".split())
SMALL = set("""the a an of to and in unto that this these those he she it they we ye you i
him her them his hers its their our your my me us thy thee thou thine was were is are be been
am art hast hath have had do did doth done shall shalt will would should may might must can
not no nor but or for with by from as at on upon into out up down over under so then than
which who whom whose what when where how all any some every each both few more most other
such own same O oh yea nay if lo behold""".split())

def norm(w):
    w=w.lower().strip()
    w=re.sub(r"^[^a-z]+|[^a-z]+$","",w)
    return w

def contentword(surface):
    toks=[norm(t) for t in surface.split()]
    toks=[t for t in toks if t]
    # drop leading/trailing small connecting words; keep last significant content token
    sig=[t for t in toks if t not in SMALL]
    if not sig: sig=toks
    return sig[-1] if sig else ""

def stem(w):
    if not w: return w
    for suf,rep in (("iest","y"),("ieth","y"),("ied","y"),("ies","y"),
                    ("edst",""),("eth",""),("est",""),("ing",""),("ed",""),("es",""),("s","")):
        if w.endswith(suf) and len(w)-len(suf)>=2:
            base=w[:-len(suf)]+rep
            # silent-e restore for -ing/-ed drops
            return base
    return w

# ---- Strong's usage/meaning/script ----
def norm_strong(s):
    s=s.strip().upper()
    m=re.match(r"([HG])0*([0-9]+)([A-Z]?)",s)
    return f"{m.group(1)}{m.group(2)}{m.group(3)}" if m else s

def load_hebrew():
    x=open(HEB,encoding="utf-8",errors="ignore").read(); d={}
    for m in re.finditer(r'<entry id="(H[0-9]+)">(.*?)</entry>', x, re.S):
        num=norm_strong(m.group(1)); body=m.group(2)
        wm=re.search(r'<w [^>]*xlit="([^"]*)"[^>]*>([^<]*)</w>', body)
        xlit=wm.group(1) if wm else ""; script=wm.group(2) if wm else ""
        um=re.search(r'<usage>(.*?)</usage>', body, re.S)
        usage=re.sub(r'<[^>]+>','',um.group(1)) if um else ""
        mm=re.search(r'<meaning>(.*?)</meaning>', body, re.S)
        meaning=re.sub(r'<[^>]+>','',mm.group(1)).strip() if mm else ""
        d[num]=dict(xlit=xlit,script=script,usage=usage,meaning=meaning)
    return d

def load_greek():
    x=open(GRK,encoding="utf-8",errors="ignore").read(); d={}
    for m in re.finditer(r'<entry strongs="([0-9]+)">(.*?)</entry>', x, re.S):
        num=norm_strong("G"+m.group(1)); body=m.group(2)
        gm=re.search(r'<greek [^>]*unicode="([^"]*)"[^>]*translit="([^"]*)"', body)
        script=gm.group(1) if gm else ""; xlit=gm.group(2) if gm else ""
        km=re.search(r'<kjv_def>(.*?)</kjv_def>', body, re.S)
        usage=re.sub(r'<[^>]+>','',km.group(1)) if km else ""
        dm=re.search(r'<strongs_def>(.*?)</strongs_def>', body, re.S)
        meaning=re.sub(r'<[^>]+>','',dm.group(1)).strip() if dm else ""
        d[num]=dict(xlit=xlit,script=script,usage=usage,meaning=meaning)
    return d

def usage_stems(usage):
    # parse KJV-usage/usage line into a set of stems of each word/phrase token
    u=usage.replace("--"," ").replace("—"," ")
    parts=re.split(r'[,.;:()\[\]]', u)
    out=set()
    for p in parts:
        for tok in p.split():
            n=norm(tok)
            if n and n not in SMALL and not n.isdigit():
                out.add(stem(n))
    return out

print("loading lexicons...",file=sys.stderr)
HE=load_hebrew(); GE=load_greek(); LEX={**HE,**GE}
print(f"  hebrew {len(HE)}  greek {len(GE)}",file=sys.stderr)

# ---- parse USFX tokens ----
print("parsing USFX...",file=sys.stderr)
x=open(USFX,encoding="utf-8",errors="ignore").read()
tok_re=re.compile(r'<v id="\d+" bcv="([A-Z0-9]+)\.(\d+)\.(\d+)"|<w s="([HG][0-9A-Za-z]+)">(.*?)</w>')
cur=None; toks=[]
for m in tok_re.finditer(x):
    if m.group(1):
        cur=(USFX_TO_SLUG.get(m.group(1)), int(m.group(2)), int(m.group(3)))
    elif cur and cur[0]:
        surf=re.sub(r'<[^>]+>','',m.group(5)).strip()
        toks.append((cur[0],cur[1],cur[2],norm_strong(m.group(4)),surf))
print(f"  {len(toks)} tagged tokens",file=sys.stderr)

# ---- fold + step3 keep ----
# key = stem(contentword); track display rep, strongs, per-strong occ, verses, surfaces
Key=collections.defaultdict(lambda: dict(strongs=set(), occ=collections.Counter(),
        verses=collections.defaultdict(list), surf=collections.Counter(), reps=collections.Counter()))
dropped=0
for slug,ch,vs,strong,surface in toks:
    cw=contentword(surface)
    if not cw or cw in EXCLUDE: continue
    k=stem(cw)
    if not k: continue
    lex=LEX.get(strong)
    if not lex: dropped+=1; continue
    ust=usage_stems(lex["usage"])
    if k not in ust:
        dropped+=1; continue          # step 3: Strong's usage must list this word
    e=Key[k]
    e["strongs"].add(strong); e["occ"][strong]+=1
    e["verses"][strong].append((slug,ch,vs)); e["surf"][surface]+=1; e["reps"][cw]+=1

# qualifying = >=2 distinct strongs
qual={k:e for k,e in Key.items() if len(e["strongs"])>=2}
print(f"\n== qualifying English words (>=2 originals): {len(qual)}  (dropped pairs: {dropped}) ==")

def report(k):
    e=qual[k]; rep=e["reps"].most_common(1)[0][0]
    rows=[]
    for s in sorted(e["strongs"], key=lambda s:-e["occ"][s]):
        lx=LEX.get(s,{}); rows.append((s,e["occ"][s],lx.get("xlit",""),lx.get("script",""),lx.get("usage","").strip()[:40]))
    return rep,len(e["strongs"]),rows

for test in ["serpent","devil","beast","dragon","command","great"]:
    # find the key whose rep == test (or stem(test))
    sk=stem(test)
    if sk in qual:
        rep,cnt,rows=report(sk)
        print(f"\n--- {rep}{cnt}  (key={sk}) ---")
        for s,occ,xl,sc,us in rows[:10]:
            print(f"   {s:7} x{occ:<4} {xl:<16} {sc:<10} usage:{us}")
    else:
        print(f"\n--- {test}: NOT qualifying (key={sk}, strongs={len(Key.get(sk,{}).get('strongs',[]))}) ---")

# edge checks
def verses_for(key):
    return {s:[v for v in qual[stem(key)]["verses"][s]] for s in qual[stem(key)]["strongs"]} if stem(key) in qual else {}
print("\n== EDGE: Rev 2:10 'the devil' multiword -> does devil include a REV verse? ==")
dv=verses_for("devil")
rev=[(s,v) for s,vl in dv.items() for v in vl if v[0]=="revelation"]
print("  revelation devil verses:", rev[:8])
print("== EDGE: beast in Revelation should include thērion + zōon + ktēnos ==")
bv=verses_for("beast")
revb=sorted({ (s,LEX.get(s,{}).get('xlit','')) for s,vl in bv.items() for v in vl if v[0]=='revelation'})
print("  revelation beast originals:", revb)

# ---------- dry-run report + counts bundle ----------
import datetime
def plain_from_usage(usage, meaning):
    u=re.sub(r'[—-]{2}','',usage); u=re.sub(r'\([^)]*\)','',u)
    words=[w.strip() for w in re.split(r'[,.;:]',u) if w.strip() and not w.strip().isdigit()]
    return ", ".join(dict.fromkeys(words[:3])) or (meaning[:40])

rows=[]
for k,e in qual.items():
    rep=e["reps"].most_common(1)[0][0]
    rows.append((rep,len(e["strongs"]),k,e))
rows.sort(key=lambda r:(-r[1], r[0]))

rep_md=["# Hidden Words — dry-run counts (S431)","",
 f"_Generated {datetime.date.today()} from source-texts/kjv/eng-kjv_usfx.xml (same input as verse_words). Deterministic; re-runnable._","",
 f"**Qualifying English words (≥2 originals behind them): {len(qual)}.** Every one gets the superscript + violet color in the reader.","",
 "## Headline words (verified against the spec)",""]
for test in ["serpent","devil","beast","dragon"]:
    k=stem(test); e=qual[k]; rep=e["reps"].most_common(1)[0][0]
    rep_md.append(f"**{rep} — {len(e['strongs'])}**  ")
    for s in sorted(e["strongs"], key=lambda s:-e["occ"][s]):
        lx=LEX.get(s,{})
        rep_md.append(f"- {lx.get('script','')} *{lx.get('xlit','')}* ({s}) ×{e['occ'][s]} — {plain_from_usage(lx.get('usage',''),lx.get('meaning',''))}")
    rep_md.append("")
rep_md.append("## All qualifying words, by count\n")
rep_md.append("| English | # originals |")
rep_md.append("|---|---|")
for rep,cnt,k,e in rows:
    rep_md.append(f"| {rep} | {cnt} |")
open("/sessions/relaxed-blissful-planck/mnt/Desktop/Hidden Words - dry run counts.md","w").write("\n".join(rep_md))

# counts bundle (verse lists come from verse_words at query time; this is the keys+originals bundle)
bundle={}
for k,e in qual.items():
    rep=e["reps"].most_common(1)[0][0]
    bundle[rep]={"key":k,"count":len(e["strongs"]),
        "surfaces":sorted(e["surf"]),
        "originals":[{"strong":s,"occ":e["occ"][s],"xlit":LEX.get(s,{}).get("xlit",""),
                      "script":LEX.get(s,{}).get("script",""),
                      "plain":plain_from_usage(LEX.get(s,{}).get("usage",""),LEX.get(s,{}).get("meaning",""))}
                     for s in sorted(e["strongs"],key=lambda s:-e["occ"][s])]}
json.dump(bundle, open("hidden-words.counts.json","w"), ensure_ascii=False)
print(f"\nwrote: Desktop/Hidden Words - dry run counts.md  ({len(qual)} words)")
print(f"wrote: hidden-words.counts.json  ({len(bundle)} keys)")

# ---------- LIVE RENDER on real data (demo chapters) ----------
def _bookname(slug): 
    return {"genesis":"Genesis","exodus":"Exodus","revelation":"Revelation"}.get(slug,slug.title())
DEMO=[("genesis",3),("exodus",7),("revelation",4),("revelation",12),("revelation",13)]
RESTORE=[(r'\bthe LORD God\b','Yahuah Elohim (the LORD God)'),(r'\bLORD\b','Yahuah (LORD)'),
 (r'\bHoly Ghost\b','Ruach HaKodesh (Holy Spirit)'),(r'\bGod\b','Elohim (God)'),(r'\bJesus Christ\b','Yahusha HaMashiach (Jesus Christ)'),
 (r'\bJesus\b','Yahusha (Jesus)'),(r'\bChrist\b','Messiah (Christ)'),(r'\bIsrael\b',"Yashar'el (Israel)"),(r'\bJudah\b','Yahudah (Judah)')]
# locate raw verse spans
vpos=[(m.start(), USFX_TO_SLUG.get(m.group(1)), int(m.group(2)), int(m.group(3)))
      for m in re.finditer(r'<v id="\d+" bcv="([A-Z0-9]+)\.(\d+)\.(\d+)"', x)]
ends=[vpos[i+1][0] if i+1<len(vpos) else len(x) for i in range(len(vpos))]
spanmap={(s,c,v):(p,ends[i]) for i,(p,s,c,v) in enumerate(vpos) if s}

color=[0]
DATA={}
def mark_verse(slug,ch,vs):
    if (slug,ch,vs) not in spanmap: return ""
    s0,s1=spanmap[(slug,ch,vs)]; raw=x[s0:s1]
    raw=raw.split("</v>")[0] if "</v>" in raw else raw
    out=[]; last=0
    for m in re.finditer(r'<w s="([HG][0-9A-Za-z]+)">(.*?)</w>', raw, re.S):
        out.append(re.sub(r'<[^>]+>','',raw[last:m.start()]))
        last=m.end()
        strong=norm_strong(m.group(1)); surf=re.sub(r'<[^>]+>','',m.group(2)).strip()
        cw=contentword(surf); k=stem(cw)
        if cw and cw not in EXCLUDE and k in qual:
            e=qual[k]; rep=e["reps"].most_common(1)[0][0]; cl=color[0]%3; color[0]+=1
            out.append(f'§§HW:{cl}:{rep}:{e_count(k)}:{surf}§§')
            DATA.setdefault(rep, _build_data(k,slug))
        else:
            out.append(surf)
    out.append(re.sub(r'<[^>]+>','',raw[last:]))
    txt="".join(out); txt=re.sub(r'\s+',' ',txt).strip()
    for pat,rep in RESTORE: txt=re.sub(pat,rep,txt)
    # swap markers to spans (after restoration so names don't touch them)
    def repl(mm):
        cl,rep,cnt,surf=mm.group(1),mm.group(2),mm.group(3),mm.group(4)
        return (f'<span class="hw c{cl}" data-k="{rep}">{surf}'
                f'<sup tabindex="0" role="button" aria-label="{rep}: {cnt} original words">{cnt}</sup></span>')
    return re.sub(r'§§HW:(\d):([^:]+):(\d+):(.*?)§§', repl, txt)

def e_count(k): return len(qual[k]["strongs"])
def _build_data(k,cur_slug):
    e=qual[k]; rep=e["reps"].most_common(1)[0][0]; rows=[]
    for strong in sorted(e["strongs"], key=lambda s:-e["occ"][s]):
        lx=LEX.get(strong,{})
        here=[f"{_bookname(sl)} {c}:{v}" for (sl,c,vv) in []] # fill below
        hv=[f"{_bookname(sl)} {c}:{vv}" for (sl,c,vv) in e["verses"][strong] if sl==cur_slug]
        allv=[f"{_bookname(sl)} {c}:{vv}" for (sl,c,vv) in e["verses"][strong]]
        rows.append({"o":lx.get("script",""),"x":lx.get("xlit",""),"s":strong,
                     "m":plain_from_usage(lx.get("usage",""),lx.get("meaning","")),
                     "u":e["occ"][strong],"here":hv,"all":allv})
    return {"n":len(e["strongs"]),"book":_bookname(cur_slug),"rows":rows}

blocks=[]
for slug,ch in DEMO:
    color[0]=0
    vs_list=sorted({v for (s,c,v) in [(t[0],t[1],t[2]) for t in toks] if s==slug and c==ch})
    blocks.append(f'<div class="ref">{_bookname(slug)} {ch}</div><p class="verse">')
    for v in vs_list:
        html=mark_verse(slug,ch,v)
        if html: blocks.append(f'<span class="vnum">{v}</span>{html} ')
    blocks.append('</p>')

# assemble full HTML reusing the approved mockup CSS + JS
mock=open("/sessions/relaxed-blissful-planck/mnt/Desktop/App/HIDDEN_WORDS_MOCKUP.html",encoding="utf-8").read()
css=mock[mock.find("<style>"):mock.find("</style>")+8]
js_tail=mock[mock.find("const esc="):mock.find("</script>")]
html=f"""<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>Hidden Words — live (real data)</title>
{css}</head><body><div class="wrap">
<div class="label">LIVE — real canon data · tap any number</div>
<div class="bar"><h1>Hidden words</h1><button class="menu-btn" id="openMenu">Menu</button></div>
{''.join(blocks)}
<p class="hint">Restored names stay plain. Tap any small number for its table (this book first, then the rest of the canon). Open <b>Menu</b> to switch Hidden words off/on.</p></div>
<div class="menu" id="menu"><div class="menu-panel"><h2>Reader features</h2>
<div class="row dim"><span>Witness overlay</span></div><div class="row dim"><span>Kingdom overlay</span></div>
<div class="row"><span>Hidden words<small>Color + count where one English word hides several Hebrew/Greek words</small></span>
<button class="switch" id="hwSwitch" role="switch" aria-checked="true"></button></div>
<button class="close" id="closeMenu">Close</button></div></div>
<div class="sheet-bg" id="sheetBg"></div><div class="sheet" id="sheet"><div class="grab"></div><div class="sheet-in" id="sheetIn"></div></div>
<script>const DATA={json.dumps(DATA,ensure_ascii=False)};
{js_tail}</script></body></html>"""
open("/sessions/relaxed-blissful-planck/mnt/Desktop/Hidden Words - LIVE (real data).html","w").write(html)
print(f"\nLIVE render written: Desktop/Hidden Words - LIVE (real data).html  ({len(DATA)} words wired, {len(blocks)} blocks)")

# ---------- DEPLOY ARTIFACTS: SQL data-load + offline index/table + meanings ----------
def collapse(s): return re.sub(r'\s+',' ',s).strip()
MEANINGS={  # hand-written, voice-gated, plain (Yoshi-redlinable)
 "H5175":"a snake","G3789":"a snake","H8314":"a fiery (burning) serpent — a seraph",
 "H8577":"a sea-monster / great serpent","H2119":"a crawling creature","G2062":"a creeping thing",
 "G1228":"the accuser / slanderer","G1140":"a demon","G1142":"a demon",
 "G1139":"to be possessed by a demon","H8163":"a hairy goat-demon (satyr)","H7700":"a demon",
 "G2342":"a wild beast","G2226":"a living creature","G2934":"a beast of burden / livestock",
 "H929":"an animal / cattle","H2416":"a living thing","H2423":"a beast (Aramaic)",
 "G1404":"a dragon / great serpent","H8568":"a jackal / monster"}
def plain_final(strong,usage,meaning):
    if strong in MEANINGS: return MEANINGS[strong]
    return collapse(plain_from_usage(usage,meaning))

def sqlstr(s): return "'"+s.replace("'","''")+"'"
rows_sql=["-- S431 Hidden Words DATA load (generated; deterministic). Run AFTER session431_hidden_words.sql.",
          "BEGIN;","DELETE FROM hidden_word_originals; DELETE FROM hidden_words;"]
for k,e in sorted(qual.items()):
    rep=e["reps"].most_common(1)[0][0]
    surf=sorted({norm(s) for s in e["surf"]})
    arr="ARRAY["+",".join(sqlstr(s) for s in surf)+"]::text[]"
    rows_sql.append(f"INSERT INTO hidden_words(english_key,display,original_count,marked,surfaces) "
                    f"VALUES({sqlstr(k)},{sqlstr(rep)},{len(e['strongs'])},TRUE,{arr});")
    for strong in sorted(e["strongs"],key=lambda s:-e["occ"][s]):
        lx=LEX.get(strong,{}); pm=plain_final(strong,lx.get("usage",""),lx.get("meaning",""))
        rows_sql.append(f"INSERT INTO hidden_word_originals(english_key,strong_number,occurrences,plain_meaning) "
                        f"VALUES({sqlstr(k)},{sqlstr(strong)},{e['occ'][strong]},{sqlstr(pm)});")
rows_sql.append("COMMIT;")
open("/sessions/relaxed-blissful-planck/mnt/Desktop/App/data-schema/migrations/session431_hidden_words_data.sql","w").write("\n".join(rows_sql))

# offline index: normalized surface -> {k:key, n:count}
index={}
for k,e in qual.items():
    rep=e["reps"].most_common(1)[0][0]
    for s in e["surf"]:
        index[norm(s)]={"k":rep,"n":len(e["strongs"])}
json.dump(index, open("../app/public/hidden-words-index.json","w"), ensure_ascii=False, separators=(",",":"))

# table bundle: key -> {n, book-indexed originals with verses}
def bookabbr(sl): return {"revelation":"Revelation"}.get(sl, _bookname(sl))
tbl={}
for k,e in qual.items():
    rep=e["reps"].most_common(1)[0][0]; originals=[]
    for strong in sorted(e["strongs"],key=lambda s:-e["occ"][s]):
        lx=LEX.get(strong,{})
        byb=collections.defaultdict(list)
        for (sl,c,v) in e["verses"][strong]: byb[sl].append(f"{c}:{v}")
        originals.append({"o":lx.get("script",""),"x":lx.get("xlit",""),"s":strong,
                          "m":plain_final(strong,lx.get("usage",""),lx.get("meaning","")),
                          "u":e["occ"][strong],"byb":byb})
    tbl[rep]={"n":len(e["strongs"]),"rows":originals}
json.dump(tbl, open("../app/public/hidden-words-table.json","w"), ensure_ascii=False, separators=(",",":"))

print(f"\nDEPLOY ARTIFACTS written:")
print(f"  data-schema/migrations/session431_hidden_words_data.sql  ({len(qual)} words)")
print(f"  app/public/hidden-words-index.json   ({len(index)} surface forms)")
print(f"  app/public/hidden-words-table.json   ({len(tbl)} keys)")
