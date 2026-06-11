#!/usr/bin/env python3
"""Arity gate: for every VALUES list, confirm each row has the same column count as
the declared column list. Balance-matches each `(VALUES ... )` region to its own
closing paren (no cross-INSERT leakage), then reads the declared col count from
context: `AS alias(cols)` right after, else `WITH name(cols) AS` right before.
Catches 'VALUES lists must all be the same length' BEFORE the DB. Ignores -- comments.
Usage: arity_check.py <file.sql> [...]"""
import re, sys

def blank_comments(sql):
    return "\n".join("" if ln.lstrip().startswith("--") else ln for ln in sql.splitlines())

def find_values_regions(sql):
    """Yield (open_idx, inner, close_idx) for each (VALUES ...) balanced region."""
    for m in re.finditer(r"\(\s*VALUES\b", sql, re.IGNORECASE):
        open_idx=m.start()
        i=m.end(); depth=1; n=len(sql)
        while i<n and depth>0:
            c=sql[i]
            if c=="'":
                i+=1
                while i<n:
                    if sql[i]=="'":
                        if i+1<n and sql[i+1]=="'": i+=2; continue
                        i+=1; break
                    i+=1
                continue
            if c=='(': depth+=1
            elif c==')': depth-=1
            i+=1
        close_idx=i-1
        inner=sql[m.end():close_idx]
        yield open_idx, inner, close_idx

def row_colcounts(inner):
    counts=[]; i=0; n=len(inner); depth=0; start=None
    while i<n:
        c=inner[i]
        if c=="'":
            i+=1
            while i<n:
                if inner[i]=="'":
                    if i+1<n and inner[i+1]=="'": i+=2; continue
                    i+=1; break
                i+=1
            continue
        if c=='(':
            if depth==0: start=i+1
            depth+=1
        elif c==')':
            depth-=1
            if depth==0 and start is not None:
                tup=inner[start:i]; d=0; commas=0; j=0; m=len(tup)
                while j<m:
                    ch=tup[j]
                    if ch=="'":
                        j+=1
                        while j<m:
                            if tup[j]=="'":
                                if j+1<m and tup[j+1]=="'": j+=2; continue
                                j+=1; break
                            j+=1
                        continue
                    if ch=='(': d+=1
                    elif ch==')': d-=1
                    elif ch==',' and d==0: commas+=1
                    j+=1
                counts.append(commas+1); start=None
        i+=1
    return counts

bad=0
for fn in sys.argv[1:]:
    sql=blank_comments(open(fn,encoding='utf-8',errors='replace').read())
    for open_idx, inner, close_idx in find_values_regions(sql):
        after=sql[close_idx+1:close_idx+120]
        before=sql[max(0,open_idx-160):open_idx]
        ncol=None; src=None
        ma=re.match(r"\s*AS\s+\w+\(([^)]*)\)", after, re.IGNORECASE)
        if ma:
            ncol=ma.group(1).count(',')+1; src="AS-alias"
        else:
            mb=re.search(r"WITH\s+\w+\(([^)]*)\)\s+AS\s*$", before, re.IGNORECASE|re.DOTALL)
            if mb:
                ncol=mb.group(1).count(',')+1; src="WITH-CTE"
        rows=row_colcounts(inner)
        if ncol is None:
            print(f"[{fn}] VALUES region @{open_idx}: could NOT find col declaration (rows={len(rows)}, sample cols={rows[:3]})")
            continue
        wrong=[(idx,r) for idx,r in enumerate(rows) if r!=ncol]
        if wrong:
            bad+=len(wrong)
            print(f"[{fn}] {src} declares {ncol} cols; {len(wrong)}/{len(rows)} rows differ: {wrong[:10]}")
print(f"\n=== ARITY: {bad} bad row(s) ===")
sys.exit(1 if bad else 0)
