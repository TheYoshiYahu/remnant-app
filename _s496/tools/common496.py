"""S496 — shared helpers for the Matthew REBUILD chain (assemble496 / gen_sql496 / seed496 / check496 / dump496 / gen_deploy496).
The rebuild rewrites existing cards IN PLACE (id kept), adds them to threads, and anchors unanchored threads — the UPDATE path beside
the S495 INSERT chain. Text lookup, quotation matching and the forbidden-phrase scan come from the S495 chain's common495.py (one copy:
_s495/tools on the Mac). Nothing here is prose. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, re, os, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
W6 = Path(os.environ.get('S496_HOME') or HERE.parent)                 # the S496 chain root (out/ fix/ sql/ deploy/ scratch/ packets/)
for p in (HERE, W6.parent / '_s495' / 'tools'):
    if (p / 'common495.py').exists():
        sys.path.insert(0, str(p)); break
if not os.environ.get('S495_HOME') and (HERE / 'common495.py').exists(): os.environ['S495_HOME'] = str(W6)   # sandbox layout: live/ parsed/ beside tools/
from common495 import *   # W (the S495 root: live/, parsed/), parsed_text, NAMES, norm, quote_in, has_phrase_of, forbidden_scan, TRAIL_RE, LEAD_RE, ...

BATCHES = {'b1': ('matthew', range(1, 8)), 'b2': ('matthew', range(8, 14))}
ED = 'canon'
TITLES = dict(canon_titles()); TITLES['psalms'] = 'Psalm'
def live_file(book): return W / 'live' / f'canon__{book}.json'
def load_live_book(book): return json.load(open(live_file(book)))
def tag_of6(batch): return f's496_{batch}'

# ---- extra prose rules for the rebuild (on top of common495.forbidden_scan) ----
EXTRA = [(re.compile(p, f), label) for p, f, label in [
    (r"\b(?:pericope|typolog\w*|diagnostic|prototype|pre-?figur\w*|marker|grid|locked)\b", re.I, 'jargon'),
    (r"\bgraft\w*", re.I, 'grafted (the nations are not grafted in; say what the verse says)'),
    (r"\b(?:Trinity|Trinitarian|three persons|second person)\b", re.I, 'Trinity language'),
    (r"\b(?:Matt|Mk|Lk|Jn|Gen|Exod?|Lev|Num|Deut|Isa|Jer|Ezek|Dan|Hos|Zech|Mal|Ps|Prov|Rom|Gal|Heb|Rev)\.? \d", 0, 'abbreviated book name'),
    (r"\bvv?\.\s?\d", 0, "'v.N' shorthand"),
    (r"\b(?:Tanakh|Old Testament|New Testament|NT|OT|LXX|Septuagint)\b", 0, 'scholar shorthand'),
    (r"→|=>|\+ ", 0, 'arrow / plus shorthand'),
]]
SACRED = r"(?:Ruach HaKodesh|Yahusha HaMashiach|HaMashiach Yahusha|Yahuah Elohim|Yahuah|Yahusha|Elohim|Messiah|Yashar'el|Yashar’el|Yahudah|Yahudim|Yahudi)"
BARE_SACRED = re.compile(rf"\b{SACRED}(?:'s|’s)?(?!\s*\()(?![A-Za-z'’])")
BARE_ENGLISH = re.compile(r"\b(?:God|Jesus|Christ|Israel|Judah|Jews?|Jewish|LORD|Lord|Holy Spirit|Holy Ghost)\b")

def prose_scan(text):
    """rule hits for prose a drafter wrote (outside italics): common495's forbidden list + the rebuild's extras + sacred-name discipline"""
    out = list(forbidden_scan(text)); prose = strip_italics(text)
    for rx, label in EXTRA:
        m = rx.search(prose)
        if m: out.append(f"{label}: '{m.group(0)}'")
    m = BARE_SACRED.search(prose)
    if m: out.append(f"sacred name without its parenthetical: '{m.group(0)}'")
    m = BARE_ENGLISH.search(re.sub(r"\([^)]*\)", " ", prose))
    if m: out.append(f"bare English name in prose: '{m.group(0)}'")
    if re.search(r"(?:—[^—]{0,60}){3,}", prose): out.append('three or more dashes strung in one run')
    return out

def compose_note(tgt_name, tc, tv, tgt_text, src_text, ch, vn, prose):
    """the card the reader sees: the target verse whole, the Matthew verse whole, then the plain prose"""
    return f"{tgt_name} {tc}:{tv} — *{tgt_text}* *{src_text}* (Matthew {ch}:{vn}) {prose.strip()}"

def compose_member(tgt_name, tc, tv, tgt_text, phrase, sentence):
    if phrase == 'WHOLE': q = tgt_text                       # the verse exactly as it stands, its own closing mark kept
    else:
        q = phrase.strip().rstrip(',;:—– ')
        if q[-1] not in '.?!': q += '.'
    return f"{tgt_name} {tc}:{tv} — *{q}* {sentence.strip()}"

def quote_checks(text, where, fail, warn):
    """every italic followed or led by a citation: verbatim against parsed/canon.json (the canon convention)"""
    seen = set()
    for rx, qi in ((TRAIL_RE, 1), (LEAD_RE, 5)):
        for m in rx.finditer(text):
            q = m.group(qi); e, slug = NAMES[m.group('name')]; c = int(m.group('c')); v = int(m.group('v')); v2 = int(m.group('v2')) if m.group('v2') else v
            if (q, slug, c, v, v2) in seen: continue
            seen.add((q, slug, c, v, v2))
            span = [parsed_text(e, slug, c, k) for k in range(v, v2 + 1)]
            if any(s is None for s in span): fail(where, f"citation {m.group('name')} {c}:{v}: no such verse in the parsed library"); continue
            ok, detail = quote_in(' '.join(span), q)
            if not ok: fail(where, f"italic quotation off at {m.group('name')} {c}:{v} — {detail}; quote: '{q[:80]}'")
            elif detail: warn(where, f"{m.group('name')} {c}:{v}: {detail}")
    for m in re.finditer(rf"\((?P<name>{NAME_RE})\.? (?P<c>\d+):(?P<v>\d+)", text):
        e, slug = NAMES[m.group('name')]
        if parsed_text(e, slug, int(m.group('c')), int(m.group('v'))) is None: fail(where, f"citation ({m.group(0)[1:]}) names a verse that does not exist")
