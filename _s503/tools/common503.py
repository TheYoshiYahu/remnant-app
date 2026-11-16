"""S503 — shared helpers for the STRAGGLER rebuild (the last orphan cards outside the gospels: Joshua 12, Revelation 1/11/20, Romans 11,
1 Thessalonians 4, Genesis 35, Ezekiel 17, 2 Esdras 7, 2 Baruch 50). Same UPDATE path as _s496 (note rewritten in place, id kept, card
joined to a live thread), made EDITION-AWARE on both ends: the source book may be an extras book (2 Esdras, 2 Baruch) and the target may
be an extras verse (Testaments XII, Ascension of Isaiah). Verse text: canon targets from parsed/canon.json (restored-names KJV, the canon
convention); extras verses from the live read-back of the SOURCE book (dump503), which carries both ends of every card. Text checks, the
forbidden-phrase scan and the sacred-name discipline are the S496 ones (common496 → common495). Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, os, sys, re
from pathlib import Path
HERE = Path(__file__).resolve().parent
W3 = Path(os.environ.get('S503_HOME') or HERE.parent)                  # _s503 root: out/ fix/ sql/ deploy/ scratch/
for p in (HERE, W3.parent / '_s496' / 'tools'):
    if (p / 'common496.py').exists(): sys.path.insert(0, str(p)); break
for p in (HERE, W3.parent / '_s495' / 'tools'):
    if (p / 'common495.py').exists(): sys.path.insert(0, str(p)); break
if not os.environ.get('S495_HOME'):
    for cand in (W3.parent / '_s495', W3):
        if (cand / 'live').exists() and (cand / 'parsed').exists(): os.environ['S495_HOME'] = str(cand); break
from common496 import *            # prose_scan, compose_note, compose_member, quote_checks, TITLES, W6, words, strip_italics ...
from common495 import W, parsed_text, PARSED, ALL_EDITIONS

# the straggler books: (edition, book slug) in the order they are worked
BOOKS503 = [('canon', 'joshua'), ('canon', 'revelation'), ('canon', 'romans'), ('canon', '1-thessalonians'), ('canon', 'genesis'),
            ('canon', 'ezekiel'), ('apocrypha', '2-esdras'), ('pseudepigrapha', '2-baruch')]
TAG = 's503'
# English titles for the extras books that appear as source or target (canon titles come from TITLES)
XTITLES = {'2-esdras': '2 Esdras', '2-baruch': '2 Baruch', 'testaments-xii': 'Testaments of the Twelve Patriarchs', 'ascension-isaiah': 'Ascension of Isaiah',
           '1-enoch': '1 Enoch', 'jubilees': 'Jubilees', 'jasher': 'Jasher', 'ecclesiasticus': 'Sirach', 'tobit': 'Tobit', 'the-wisdom-of-solomon': 'Wisdom of Solomon',
           'adam-eve': 'Adam and Eve', '2-enoch': '2 Enoch', 'apocalypse-of-abraham': 'Apocalypse of Abraham'}
def title_of(ed, book): return TITLES[book] if ed == 'canon' and book in TITLES else XTITLES.get(book, book)
def live503(ed, book): return W / 'live' / f'{ed}__{book}.json'
def load503(ed, book): return json.load(open(live503(ed, book)))
def verse_text(D, ed, book, ch, vn):
    """canon → parsed/canon.json (the canon convention); extras → the live read-back D (its live{} or a card end), else parsed extras"""
    if ed == 'canon': return parsed_text('canon', book, ch, vn)
    t = D['live'].get(f'{ed}|{book}|{ch}:{vn}')
    if t is None:
        for c in D['cards']:
            for p in ('s', 't'):
                if (c[f'{p}_ed'], c[f'{p}_book'], c[f'{p}_ch'], c[f'{p}_vn']) == (ed, book, ch, vn): return c[f'{p}_text']
    return t if t is not None else parsed_text(ed, book, ch, vn)
def orphans(D, ed, book):
    threaded = {m['xref_id'] for m in D['members']}
    return [c for c in D['cards'] if c['s_ed'] == ed and c['s_book'] == book and c['id'] not in threaded]
