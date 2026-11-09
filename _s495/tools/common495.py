"""S495 — shared helpers for the Phase-2 gap-fill chain (assemble495 / gen_sql495 / seed495 / check495 / gen_deploy495 / dump495).
Text lookup (live read-back + parsed editions), the English-name → slug table for citations, quotation matching, and the
forbidden-phrase scan. Nothing here is prose; it is verification and SQL plumbing only. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, re, os, unicodedata
from pathlib import Path

# the chain's root: S495_HOME if set, else the folder above tools/ (works both in the sandbox and under ~/Desktop/App/_s495 on the Mac)
W = Path(os.environ.get('S495_HOME') or Path(__file__).resolve().parent.parent)
BOOKS = {'1-enoch': 'enoch', 'testaments-xii': 'pseudepigrapha', 'adam-eve': 'pseudepigrapha', '2-enoch': 'pseudepigrapha',
         '2-baruch': 'pseudepigrapha', 'hermas': 'lightfoot-apostolic-fathers'}
# parsed file ↔ edition slug
PARSED = {'canon': 'canon.json', 'enoch': 'enoch.json', 'jubilees': 'jubilees.json', 'jasher': 'jasher.json', 'apocrypha': 'apocrypha.json',
          'pseudepigrapha': 'pseudepigrapha-charles-vol2.json', 'adam-eve-conflict': 'adam-eve-conflict.json',
          'apocalypse-of-abraham': 'apocalypse-of-abraham.json', 'ascension-isaiah': 'ascension-isaiah.json',
          'lightfoot-apostolic-fathers': 'lightfoot-apostolic-fathers.json', 'sonnini-acts-29': 'sonnini-acts-29.json'}
# every edition slug session417 listed, plus any seen in the live read-backs (josephus is in both)
ALL_EDITIONS = ['canon', 'enoch', 'jubilees', 'jasher', 'apocrypha', 'apocrypha-charles-vol1', 'pseudepigrapha', 'adam-eve-conflict',
                'apocalypse-of-abraham', 'ascension-isaiah', 'sonnini-acts-29', 'josephus', 'lightfoot-apostolic-fathers', 'mrjames-apocryphal-nt']

def live_path(book): return W / 'live' / f"{BOOKS[book]}__{book}.json"
def load_live(book): return json.load(open(live_path(book)))

_parsed_cache = {}
def parsed_edition(ed):
    """{'book|ch:vn': text} for one parsed edition; chapter-0 intro rows with no verses are skipped."""
    if ed not in _parsed_cache:
        f = PARSED.get(ed)
        if f is None or not (W / 'parsed' / f).exists(): _parsed_cache[ed] = None
        else:
            d = json.load(open(W / 'parsed' / f)); m = {}
            for b in d['books']:
                for ch in b['chapters']:
                    for v in ch.get('verses') or []: m[f"{b['book_id']}|{ch['number']}:{v['number']}"] = v['text']
            _parsed_cache[ed] = m
    return _parsed_cache[ed]

def parsed_text(ed, book, ch, vn):
    m = parsed_edition(ed)
    return None if m is None else m.get(f"{book}|{ch}:{vn}")

def canon_titles():
    d = json.load(open(W / 'parsed' / 'canon.json'))
    return {b['book_id']: b['book_title'] for b in d['books']}

# ---- English book name → (edition, book slug). Longest name wins when matching. ----
def name_table():
    t = {}
    for slug, title in canon_titles().items(): t[title] = ('canon', slug)
    t['Psalm'] = ('canon', 'psalms'); t['Canticles'] = ('canon', 'song-of-solomon'); t['Song of Songs'] = ('canon', 'song-of-solomon')
    t['Revelation of John'] = ('canon', 'revelation'); t['Apocalypse'] = ('canon', 'revelation')
    for n in ('1 Enoch', 'Enoch', 'Book of Enoch', 'First Enoch'): t[n] = ('enoch', '1-enoch')
    for n in ('2 Enoch', 'Second Enoch', 'Secrets of Enoch', 'Book of the Secrets of Enoch'): t[n] = ('pseudepigrapha', '2-enoch')
    for n in ('2 Baruch', 'Second Baruch', 'Syriac Apocalypse of Baruch', 'Apocalypse of Baruch'): t[n] = ('pseudepigrapha', '2-baruch')
    for n in ('3 Baruch', 'Greek Apocalypse of Baruch'): t[n] = ('pseudepigrapha', '3-baruch')
    t['3 Maccabees'] = ('pseudepigrapha', '3-maccabees'); t['4 Maccabees'] = ('pseudepigrapha', '4-maccabees')
    for n in ('Adam and Eve', 'Life of Adam and Eve', 'Books of Adam and Eve', 'Apocalypse of Moses', 'Vita Adae', 'Vita Adae et Evae'): t[n] = ('pseudepigrapha', 'adam-eve')
    for n in ('1 Adam and Eve', 'First Book of Adam and Eve', 'First Adam and Eve', 'Conflict of Adam and Eve'): t[n] = ('adam-eve-conflict', '1-adam-eve')
    for n in ('2 Adam and Eve', 'Second Book of Adam and Eve', 'Second Adam and Eve'): t[n] = ('adam-eve-conflict', '2-adam-eve')
    for n in ('Testaments XII', 'Testaments of the XII Patriarchs', 'Testaments of the Twelve Patriarchs', 'Testaments of the Twelve', 'Twelve Patriarchs',
              'Testament of Reuben', 'Testament of Simeon', 'Testament of Levi', 'Testament of Judah', 'Testament of Issachar', 'Testament of Zebulun',
              'Testament of Dan', 'Testament of Naphtali', 'Testament of Gad', 'Testament of Asher', 'Testament of Joseph', 'Testament of Benjamin'):
        t[n] = ('pseudepigrapha', 'testaments-xii')
    t['Jubilees'] = ('jubilees', 'jubilees'); t['Book of Jubilees'] = ('jubilees', 'jubilees')
    t['Jasher'] = ('jasher', 'jasher'); t['Book of Jasher'] = ('jasher', 'jasher')
    for n in ('Hermas', 'Shepherd of Hermas', 'The Shepherd of Hermas', 'The Shepherd'): t[n] = ('lightfoot-apostolic-fathers', 'hermas')
    t['1 Clement'] = ('lightfoot-apostolic-fathers', '1-clement'); t['2 Clement'] = ('lightfoot-apostolic-fathers', '2-clement')
    t['Didache'] = ('lightfoot-apostolic-fathers', 'didache'); t['Epistle of Barnabas'] = ('lightfoot-apostolic-fathers', 'barnabas'); t['Barnabas'] = ('lightfoot-apostolic-fathers', 'barnabas')
    t['Martyrdom of Polycarp'] = ('lightfoot-apostolic-fathers', 'martyrdom-polycarp')
    for n, s in (('Ephesians', 'ephesians'), ('Magnesians', 'magnesians'), ('Trallians', 'trallians'), ('Romans', 'romans'), ('Philadelphians', 'philadelphians'), ('Smyrnaeans', 'smyrnaeans'), ('Polycarp', 'polycarp')):
        t[f'Ignatius to the {n}' if n != 'Polycarp' else 'Ignatius to Polycarp'] = ('lightfoot-apostolic-fathers', f'ignatius-{s}')
    for n in ('Sirach', 'Ecclesiasticus', 'Ben Sira', 'Wisdom of Sirach'): t[n] = ('apocrypha', 'ecclesiasticus')
    for n in ('Wisdom', 'Wisdom of Solomon', 'The Wisdom of Solomon'): t[n] = ('apocrypha', 'the-wisdom-of-solomon')
    t['Tobit'] = ('apocrypha', 'tobit'); t['Judith'] = ('apocrypha', 'judith')
    t['1 Maccabees'] = ('apocrypha', '1-maccabees'); t['2 Maccabees'] = ('apocrypha', '2-maccabees')
    t['1 Esdras'] = ('apocrypha', '1-esdras'); t['2 Esdras'] = ('apocrypha', '2-esdras'); t['4 Ezra'] = ('apocrypha', '2-esdras')
    t['Baruch'] = ('apocrypha', 'baruch-with-the-letter-of-jeremiah'); t['Letter of Jeremiah'] = ('apocrypha', 'baruch-with-the-letter-of-jeremiah')
    t['Rest of Esther'] = ('apocrypha', 'the-rest-of-esther'); t['Additions to Esther'] = ('apocrypha', 'the-rest-of-esther')
    t['Song of the Three Holy Children'] = ('apocrypha', 'the-song-of-the-three-holy-children'); t['Song of the Three Children'] = ('apocrypha', 'the-song-of-the-three-holy-children')
    t['Susanna'] = ('apocrypha', 'the-history-of-susanna'); t['History of Susanna'] = ('apocrypha', 'the-history-of-susanna')
    t['Bel and the Dragon'] = ('apocrypha', 'bel-and-the-dragon'); t['Prayer of Manasseh'] = ('apocrypha', 'the-prayer-of-manasseh'); t['Prayer of Manasses'] = ('apocrypha', 'the-prayer-of-manasseh')
    t['Apocalypse of Abraham'] = ('apocalypse-of-abraham', 'apocalypse-of-abraham'); t['Ascension of Isaiah'] = ('ascension-isaiah', 'ascension-isaiah')
    t['Acts 29'] = ('sonnini-acts-29', 'sonnini-acts-29')
    return t

NAMES = name_table()
NAME_RE = '(?:' + '|'.join(sorted((re.escape(n) for n in NAMES), key=len, reverse=True)) + ')'
# `*…* (Book c:v)` / `*…* (Book c:v–v)` and the lead form `Book c:v — *…*`
TRAIL_RE = re.compile(rf"\*([^*]+)\*\s*\((?P<name>{NAME_RE})\.? (?P<c>\d+):(?P<v>\d+)(?:\s*[–—-]\s*(?P<v2>\d+))?\)")
LEAD_RE = re.compile(rf"(?<![A-Za-z0-9])(?P<name>{NAME_RE})\.? (?P<c>\d+):(?P<v>\d+)(?:\s*[–—-]\s*(?P<v2>\d+))?\s*[—–-]+\s*\*([^*]+)\*")

def english_names(ed, slug):
    return [n for n, v in NAMES.items() if v == (ed, slug)]

def norm(s):
    """for quotation matching only: NFKD, drop combining marks, unify quotes/dashes, lower, letters+digits+spaces."""
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = s.replace('’', "'").replace('‘', "'").replace('“', '"').replace('”', '"').replace('—', ' ').replace('–', ' ')
    s = re.sub(r"[\[\]{}'\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()

def pieces(q): return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]

def quote_in(text, q, min_words=4):
    """every piece of an ellipsis-split quotation appears in `text` in order. Returns (ok, detail). Pieces shorter than
    min_words are matched too but only reported as 'short' — the caller may downgrade them to a warning."""
    t = norm(text); pos = 0; short = []
    for p in pieces(q):
        i = t.find(p, pos)
        if i < 0:
            if len(p.split()) < min_words: short.append(p); continue
            return False, f"run not in verse: '{p[:60]}'"
        pos = i + len(p)
    return True, ('short runs unverified: ' + '; '.join(short)) if short else ''

def has_phrase_of(text, verse, n=6):
    """does `text` carry ≥ n consecutive (normalised) words of `verse`?"""
    tw = norm(text).split(); vw = norm(verse)
    for i in range(len(tw) - n + 1):
        if ' '.join(tw[i:i + n]) in vw: return True
    return False

# ---- forbidden phrases (scanned on prose OUTSIDE italics, so scripture that itself says 'substance' or 'son of man' is not flagged) ----
FORBIDDEN = [(re.compile(p, f), label) for p, f, label in [
    (r"Red Line", 0, 'Red Line'), (r"voice skill", re.I, 'voice skill'), (r"\bframework\b", re.I, 'framework'), (r"\bsubstance\b", re.I, 'substance'),
    (r"\barchitecture\b", re.I, 'architecture'), (r"\bmotif\b", re.I, 'motif'), (r"\bapparatus\b", re.I, 'apparatus'), (r"\bregister\b", re.I, 'register'),
    (r"\bS\d{2,3}[a-f]?\b", 0, 'S1xx token'), (r"\bYoshi\b", 0, 'Yoshi'), (r"SUMMATION", 0, 'SUMMATION'), (r"\bsession \d", re.I, 'session N'),
    (r"\bThis is not new\b", re.I, 'This is not new'), (r"\bJew and Gentile\b", re.I, 'Jew and Gentile'), (r"\bson of man\b", re.I, 'son of man (must be son of Adam)'),
    (r"\b(?:Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Hitgalut|Yochanan|Ivrim|Galatim)\b", 0, 'Hebrew book name'),
]]
HYPHEN_CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC_CHAIN = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
SLUG_CITE = re.compile(r"(?<![A-Za-z0-9-])(?:[a-z0-9]+(?:-[a-z0-9]+)+|hermas|jasher|jubilees|genesis|exodus|leviticus|numbers|deuteronomy|joshua|judges|ruth|psalms|proverbs|isaiah|jeremiah|ezekiel|daniel|hosea|joel|amos|obadiah|jonah|micah|nahum|habakkuk|zephaniah|haggai|zechariah|malachi|matthew|mark|luke|john|acts|romans|galatians|ephesians|philippians|colossians|hebrews|james|jude|revelation|tobit|judith|ecclesiasticus) \d+:\d*")

def strip_italics(text): return re.sub(r"\*[^*]+\*", " ", text or '')

def forbidden_scan(text):
    """list of 'label: match' strings for prose outside italics (slug cites are scanned on the whole text)."""
    out = []; prose = strip_italics(text)
    for rx, label in FORBIDDEN:
        m = rx.search(prose)
        if m: out.append(f"{label}: '{m.group(0)}'")
    ch = [h for h in HYPHEN_CHAIN.findall(prose) if not NUMERIC_CHAIN.match(h)]
    if ch: out.append(f"hyphen-chain: '{ch[0]}'")
    m = SLUG_CITE.search(text or '')
    if m: out.append(f"slug in prose: '{m.group(0)}'")
    return out

def words(s): return len(re.findall(r"[A-Za-z0-9'’]+", s or ''))

def stem_of(book):
    """output stem: the book, unless S495_STEM overrides it (the self-test uses '_selftest' so it never collides with real files)"""
    return os.environ.get('S495_STEM') or book

def load_book_fix(book): return json.load(open(W / 'fix' / f'{stem_of(book)}.json'))

def tag_of(book): return 's495_' + stem_of(book).strip('_').replace('-', '_')

def live_authority(book=None):
    """{edition|book|ch:vn: live text} harvested from every read-back in live/: the whole-book maps plus the s_/t_ texts of every live
    card (live verse texts too — they cover many canon verses no whole-book read-back carries). Excludes `book`'s own map when given.
    Canon verses are never taken from here (see target_text)."""
    m = {}
    for f in sorted((W / 'live').glob('*__*.json')):
        try: d = json.load(open(f))
        except Exception: continue
        if book is None or f != live_path(book): m.update(d.get('live') or {})
        for c in d.get('cards') or []:
            m.setdefault(f"{c['s_ed']}|{c['s_book']}|{c['s_ch']}:{c['s_vn']}", c['s_text']); m.setdefault(f"{c['t_ed']}|{c['t_book']}|{c['t_ch']}:{c['t_vn']}", c['t_text'])
    return m

def target_text(e, slug, ch, vn, auth):
    """the text a note must quote. CONVENTION (BRIEF463f): canon quotations come from the restored-names KJV in parsed/canon.json,
    never from the live display text (the live canon is modernised). Non-canon: the live text when a read-back carries the verse,
    else that edition's parsed file."""
    if e == 'canon': return parsed_text(e, slug, ch, vn)
    return auth.get(f"{e}|{slug}|{ch}:{vn}") or parsed_text(e, slug, ch, vn)

def majority_tier(live, ed, book):
    """the tier most of the book's live cards carry (cards whose source is the book); 'extras' when the book has none"""
    import collections
    c = collections.Counter(x['tier'] for x in live['cards'] if x['s_ed'] == ed and x['s_book'] == book)
    return c.most_common(1)[0][0] if c else 'extras'
