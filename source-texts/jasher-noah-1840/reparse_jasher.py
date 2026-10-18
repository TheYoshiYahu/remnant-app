#!/usr/bin/env python3
"""S450 — re-parse ONLY Jasher (never parse_published_editions.main(), which
overwrites every edition's JSON). usage: reparse_jasher.py <edition.txt> <out.json>"""
import sys, json, dataclasses
from pathlib import Path
APP = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(APP / 'restoration-pipeline'))
import parse_published_editions as P
text = Path(sys.argv[1]).read_text(encoding='utf-8')
ed = P.parse_jasher(text)
out = dataclasses.asdict(ed) if dataclasses.is_dataclass(ed) else ed
Path(sys.argv[2]).write_text(json.dumps(out, ensure_ascii=False, indent=2), encoding='utf-8')
chs = out['books'][0]['chapters']
print(len(chs), 'chapters', sum(len(c['verses']) for c in chs), 'verses')
