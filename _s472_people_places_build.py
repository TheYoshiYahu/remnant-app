#!/usr/bin/env python3
"""S472 — People & places: build + verify against the app's own text.

Sources (structure only — no outside descriptions are used anywhere):
  * STEPBible TIPNR (CC BY 4.0) — which person/place each name in each verse is,
    family links (parents, siblings, partners, offspring), Hebrew/Greek forms.
    TIPNR's @Brief/@Short/@Article/#Summary/Description text is AI-written church
    framing and is DROPPED here on purpose. "Who this was" blurbs come from Yoshi.
  * OpenBible ancient places (CC BY 4.0) — map pins, already live as maps_places.
  * audio-text/canon_live.json — the live app text (what the reader sees).

Launch gate (Yoshi 2026-10-25): every verse occurrence and family link is checked
against the app's own text; only what the text confirms ships. Pins must agree
between TIPNR and OpenBible.

Outputs:
  people-places/people_places.json            — the verified data
  people-places/S472_VERIFY_REPORT.md         — what was held back and why, per book
  data-schema/migrations/session472_people_places.sql
"""
import json, math, re, sys, collections
from pathlib import Path

ROOT = Path(__file__).resolve().parent
TIPNR = next((ROOT / "source-texts/stepbible-data/Proper Nouns").glob("TIPNR*.txt"))
LIVE = ROOT / "audio-text/canon_live.json"
OB_ANCIENT = ROOT / "source-texts/maps-openbible/data/ancient.jsonl"
OUT = ROOT / "people-places"
SQL = ROOT / "data-schema/migrations/session472_people_places.sql"

BOOKS = {
 "Gen":"genesis","Exo":"exodus","Lev":"leviticus","Num":"numbers","Deu":"deuteronomy",
 "Jos":"joshua","Jdg":"judges","Rut":"ruth","1Sa":"1-samuel","2Sa":"2-samuel",
 "1Ki":"1-kings","2Ki":"2-kings","1Ch":"1-chronicles","2Ch":"2-chronicles","Ezr":"ezra",
 "Neh":"nehemiah","Est":"esther","Job":"job","Psa":"psalms","Pro":"proverbs",
 "Ecc":"ecclesiastes","Sng":"song-of-solomon","Isa":"isaiah","Jer":"jeremiah",
 "Lam":"lamentations","Ezk":"ezekiel","Dan":"daniel","Hos":"hosea","Jol":"joel",
 "Amo":"amos","Oba":"obadiah","Jon":"jonah","Mic":"micah","Nam":"nahum","Hab":"habakkuk",
 "Zep":"zephaniah","Hag":"haggai","Zec":"zechariah","Mal":"malachi",
 "Mat":"matthew","Mrk":"mark","Luk":"luke","Jhn":"john","Act":"acts","Rom":"romans",
 "1Co":"1-corinthians","2Co":"2-corinthians","Gal":"galatians","Eph":"ephesians",
 "Php":"philippians","Col":"colossians","1Th":"1-thessalonians","2Th":"2-thessalonians",
 "1Ti":"1-timothy","2Ti":"2-timothy","Tit":"titus","Phm":"philemon","Heb":"hebrews",
 "Jas":"james","Jam":"james","1Pe":"1-peter","2Pe":"2-peter","1Jn":"1-john","2Jn":"2-john",
 "3Jn":"3-john","Jud":"jude","Rev":"revelation",
}
BOOK_ORDER = list(dict.fromkeys(BOOKS.values()))
REF_RE = re.compile(r'(?<![A-Za-z])(LXX\s*)?([1-3]?[A-Z][a-z]{1,2})\.(\d+)\.(\d+)[a-z]?')
TOKEN_RE = re.compile(r'([^,+]+?@[A-Za-z0-9.\-]+)\s*(\((?:\?|d|a|f)\))*')

# ---------- live text ----------
live = json.load(open(LIVE))
VERSE = {}
for c in live:
    for v in c["verses"]:
        VERSE[(c["book"], c["chapter"], v["n"])] = v["raw"]

def norm(s):
    s = s.lower().replace("’", "'")
    s = re.sub(r"[-‐-―]", " ", s)
    return re.sub(r"\s+", " ", s)

NORM_CACHE = {}
def verse_norm(key):
    if key not in NORM_CACHE:
        NORM_CACHE[key] = " " + re.sub(r"[^a-z0-9' ]", " ", norm(VERSE[key])) + " "
    return NORM_CACHE[key]

def form_in(form, key):
    f = re.sub(r"[^a-z0-9' ]", " ", norm(form)).strip()
    f = re.sub(r"\s+", " ", f)
    if not f:
        return False
    t = verse_norm(key)
    if f" {f} " in t or f" {f}'s " in t or f" {f}' " in t:
        return True
    # plural / gentilic forms (Girgashite -> Girgashites, Emim -> Emims)
    if f" {f}s " in t or f" {f}es " in t:
        return True
    # hyphenated KJV forms (Beth-el) vs closed (Bethel)
    g = f.replace(" ", "")
    return g != f and (f" {g} " in t or f" {g}'s " in t)

def one_edit(a, b):
    if a == b or abs(len(a) - len(b)) > 1:
        return a == b
    if len(a) > len(b):
        a, b = b, a
    i = j = d = 0
    while i < len(a) and j < len(b):
        if a[i] != b[j]:
            d += 1
            if d > 1:
                return False
            if len(a) == len(b):
                i += 1
            j += 1
        else:
            i += 1; j += 1
    return d + (len(b) - j) + (len(a) - i) <= 1

def variant_in(form, key):
    """Spelling variant: one letter off a capitalized word in our verse (Abida ~ Abidah).
    Single-word names of 5+ letters only, same first letter."""
    f = norm(form).strip()
    if " " in f or len(f) < 5:
        return None
    for w in re.findall(r"[A-Z][A-Za-z']+", VERSE[key]):
        w2 = w.lower().rstrip("'s") if w.lower().endswith("'s") else w.lower()
        if w2[0] == f[0] and one_edit(f, w2):
            return w
    return None

# ---------- TIPNR ----------
def parse_refs(s):
    out = []
    for lxx, b, c, v in REF_RE.findall(s):
        if lxx or b not in BOOKS:
            continue
        out.append((BOOKS[b], int(c), int(v)))
    return out

def parse_translated(s):
    """'Seth =ESV,NIV,KJV; Sheth =KJV' -> ['Seth','Sheth'] (proper-noun forms only)."""
    names = []
    for part in s.split(";"):
        nm = part.split("=")[0].strip()
        if nm and nm[0].isupper():
            names.append(nm)
    return names

def slug_of(unified):
    base = unified.split("=")[0].strip()
    base = base.split("|")[-1]
    s = base.replace("@", "-").replace(".", "-").lower()
    s = re.sub(r"[^a-z0-9\-]+", "-", s)
    return re.sub(r"-+", "-", s).strip("-")

def parse_people_list(s):
    out = []
    for m in TOKEN_RE.finditer(s or ""):
        tok, flags = m.group(1).strip(), m.group(0)[len(m.group(1)):]
        if "@" not in tok:
            continue
        out.append({"slug": slug_of(tok), "flags": "".join(re.findall(r"\((\?|d|a|f)\)", flags))})
    return out

NOT_NAMES = {"Lord", "LORD", "God", "Christian", "Christians", "Master", "Teacher", "Rabbi"}
text = TIPNR.read_text(encoding="utf-8")
records = text.split("\n$")[1:]
ents = {}
for r in records:
    lines = r.split("\n")
    head = lines[0]
    if "PERSON" in head and "PLACE" not in head:
        section = "person"
    elif "PLACE" in head:
        section = "place"
    else:
        continue  # OTHER / EXCLUDED — gods, months, songs: not people or places
    if len(lines) < 2 or "@" not in lines[1].split("\t")[0]:
        continue
    f = lines[1].split("\t")
    unified = f[0].strip()
    if "=" not in unified:
        continue
    typ = (f[8].strip() if len(f) > 8 else "")
    if section == "person" and typ not in ("Male", "Female", "Group"):
        continue
    slug = slug_of(unified)
    e = {"slug": slug, "kind": "group" if typ == "Group" else section, "type": typ,
         "unified": unified.split("=")[0], "forms": [], "refs": [], "original": None,
         "parents": [], "siblings": [], "partners": [], "offspring": [],
         "uncertain": "(?)" in lines[1].split("#")[0], "tipnr_coords": None, "ob_name": None}
    if section == "person":
        e["parents"] = parse_people_list(f[2] if len(f) > 2 else "")
        e["siblings"] = parse_people_list(f[3] if len(f) > 3 else "")
        e["partners"] = parse_people_list(f[4] if len(f) > 4 else "")
        e["offspring"] = parse_people_list(f[5] if len(f) > 5 else "")
    else:
        e["ob_name"] = (f[1].strip() or None) if len(f) > 1 else None
        m = re.search(r"@(-?\d+\.\d+),(-?\d+\.\d+)", f[4] if len(f) > 4 else "")
        if m:
            e["tipnr_coords"] = (float(m.group(1)), float(m.group(2)))
    base_name = e["unified"].split("@")[0].replace("_", " ")
    e["forms"].append(base_name)
    for ln in lines[2:]:
        if not ln.startswith("– ") or ln.startswith("– Total"):
            continue
        sf = ln.split("\t")
        sig = sf[0][2:].strip()
        if sig.startswith("Mentioned"):
            continue  # unnamed in the text — nothing to check a name against
        uniq = sf[1].strip() if len(sf) > 1 else ""
        if "|" in uniq:
            e["forms"].append(uniq.split("|")[0].replace("_", " "))
        if len(sf) > 2 and "=" in sf[2] and e["original"] is None:
            e["original"] = sf[2].split("=", 1)[1].strip() or None
        if len(sf) > 3:
            e["forms"] += parse_translated(sf[3])
        if len(sf) > 4:
            e["refs"] += parse_refs(sf[4])
    e["forms"] = list(dict.fromkeys(x for x in e["forms"] if x and x not in NOT_NAMES))
    e["refs"] = list(dict.fromkeys(e["refs"]))
    ents[slug] = e

HOLD = {}
# ---------- hand holds (identifications our text does not support) ----------
HOLD_RULES = [
    # TIPNR folds Arimathaea into its Mizpah/Ramah entry; our text names a separate town.
    ("mizpah-jos-18-26-jhn", "arimath", "TIPNR merges Arimathaea into Mizpah"),
]
for slug_, needle, why in HOLD_RULES:
    for key in ents.get(slug_, {}).get("refs", []):
        if key in VERSE and needle in VERSE[key].lower():
            HOLD[(slug_, key)] = why

# ---------- the man vs. the tribe/nation named after him ----------
# TIPNR folds tribe and nation usages into the patriarch's own record ("Levite" under Levi,
# "Jews" under Judah, the people Israel under Jacob). A person page is about the man, so
# gentilic forms are dropped from people, and for the fathers of the tribes the bare name
# only counts where the man himself is in view. Everything else is held for a tribe page.
GENTILIC = re.compile(r"(ites?|itish|itical|itess|ians?)$", re.I)
NOT_THE_MAN = {"Jews", "Jew", "Israelite", "Israelites", "Jeshurun", "Edom", "David", "Ephrathite"}
TRIBE_FATHERS = {"israel-gen-25-26-rev", "reuben-gen-29-32-rev", "simeon-gen-29-33-rev",
    "levi-gen-29-34-rev", "judah-gen-29-35-rev", "dan-gen-30-6-1ch", "naphtali-gen-30-8-rev",
    "gad-gen-30-11-rev", "asher-gen-30-13-rev", "issachar-gen-30-18-rev", "zebulun-gen-30-20-rev",
    "joseph-gen-30-24-rev", "benjamin-gen-35-18-rev", "ephraim-gen-41-52-zec", "manasseh-gen-41-51-rev"}
def the_man_in_view(key):
    b, c, v = key
    return (b == "genesis" or (b == "exodus" and (c == 1 and v <= 8 or c == 6 and 14 <= v <= 16)) or
            (b == "1-chronicles" and (c == 2 and v <= 2 or c == 5 and v <= 3 or c == 7 and 20 <= v <= 23)) or
            (b == "matthew" and c == 1) or (b == "luke" and c == 3) or (b, c) in {("acts", 7), ("hebrews", 11), ("john", 4)})
for e in ents.values():
    if e["kind"] == "person":
        e["forms"] = [f for f in e["forms"] if f not in NOT_THE_MAN and not GENTILIC.search(f)] or e["forms"][:1]
    if e["slug"] in TRIBE_FATHERS:
        for key in e["refs"]:
            if not the_man_in_view(key):
                HOLD[(e["slug"], key)] = "the tribe or nation named after him, not the man"

# ---------- verify verse occurrences ----------
held_refs = collections.defaultdict(list)   # book -> [(slug, ref)]
book_tot = collections.Counter(); book_ok = collections.Counter()
missing_verse = 0
variant_hits = []
for e in ents.values():
    ok, used = [], collections.Counter()
    for key in e["refs"]:
        book_tot[key[0]] += 1
        if key not in VERSE:
            missing_verse += 1
            held_refs[key[0]].append((e["slug"], key, "verse not in app text"))
            continue
        hit = next((fm for fm in e["forms"] if form_in(fm, key)), None)
        if (e["slug"], key) in HOLD:
            held_refs[key[0]].append((e["slug"], key, "held by hand: " + HOLD[(e["slug"], key)]))
            continue
        if not hit:
            var = next((variant_in(fm, key) for fm in e["forms"] if variant_in(fm, key)), None)
            if var:
                hit = var
                variant_hits.append((e["slug"], key, e["forms"][0], var))
                if var not in e["forms"]:
                    e["forms"].append(var)
        if hit:
            ok.append(key); used[hit] += 1; book_ok[key[0]] += 1
        else:
            held_refs[key[0]].append((e["slug"], key, "name not found in verse"))
    e["verified_refs"] = ok
    e["name"] = used.most_common(1)[0][0] if used else e["forms"][0]
    e["names"] = [n for n, _ in used.most_common()] or e["forms"][:1]

# ---------- verify family links ----------
def verses_of(slug):
    return set(ents[slug]["verified_refs"]) if slug in ents else set()

link_tot = collections.Counter(); link_ok = collections.Counter(); held_links = []
# Chapters that are family lists, where names a verse or two apart are the line itself.
GENEALOGY_CHAPTERS = {("genesis", c) for c in (4, 5, 10, 11, 22, 25, 29, 30, 35, 36, 46)} | \
    {("exodus", 6), ("numbers", 3), ("numbers", 26), ("ruth", 4), ("ezra", 2), ("ezra", 7),
     ("ezra", 8), ("ezra", 10), ("nehemiah", 3), ("nehemiah", 7), ("nehemiah", 10), ("nehemiah", 11),
     ("nehemiah", 12), ("matthew", 1), ("luke", 3)} | {("1-chronicles", c) for c in range(1, 10)} | \
    {("1-chronicles", c) for c in (11, 12, 15, 23, 24, 25, 26, 27)}
def link_verified(a, b, gap=3):
    """A verse the data assigns to BOTH individuals, else the same passage
    (within 3 verses) where each is named in a verse assigned to them."""
    if a not in ents or b not in ents:
        return None
    va, vb = verses_of(a), verses_of(b)
    both = sorted(va & vb)
    if both:
        return "%s.%d.%d" % both[0]
    for (bk, c, v) in sorted(va):
        if (bk, c) not in GENEALOGY_CHAPTERS:
            continue  # in story chapters, names a few verses apart are not a family link
        near = sorted(x for x in vb if x[0] == bk and x[1] == c and abs(x[2] - v) <= gap)
        if near:
            lo, hi = min(v, near[0][2]), max(v, near[0][2])
            passage_links.append((a, b))
            return "%s.%d.%d-%d" % (bk, c, lo, hi)
    return None
passage_links = []

links = []
for e in ents.values():
    if e["kind"] == "place":
        continue
    for rel, lst in (("parent", e["parents"]), ("sibling", e["siblings"]),
                     ("spouse", e["partners"]), ("child", e["offspring"])):
        for p in lst:
            link_tot[rel] += 1
            proof = link_verified(e["slug"], p["slug"], 3 if rel == "sibling" else 1)
            if proof:
                link_ok[rel] += 1
                links.append({"slug": e["slug"], "rel": rel, "other": p["slug"],
                              "flags": p["flags"], "proof": proof})
            else:
                why = "other person not in data" if p["slug"] not in ents else "no verse names both"
                held_links.append((e["slug"], rel, p["slug"], why))
# siblings the text confirms through a shared, confirmed parent
conf_parent = collections.defaultdict(set)
for l in links:
    if l["rel"] == "parent" and "a" not in l["flags"]:
        conf_parent[l["slug"]].add(l["other"])
still = []
for s_, rel, o, why in held_links:
    shared = conf_parent[s_] & conf_parent.get(o, set()) if rel == "sibling" else set()
    if shared:
        links.append({"slug": s_, "rel": "sibling", "other": o, "flags": "",
                      "proof": "shared parent " + sorted(shared)[0]})
        link_ok["sibling"] += 1
    else:
        still.append((s_, rel, o, why))
held_links = still
# keep each link only if both directions-independent check passed; dedupe
links = list({(l["slug"], l["rel"], l["other"]): l for l in links}.values())

# ---------- pins: TIPNR vs OpenBible ----------
ob = {}
for line in open(OB_ANCIENT):
    d = json.loads(line)
    ob[d["friendly_id"]] = d
def ob_coords(d):
    m = re.search(r"'s3b25cf': \{'ids': \[([^\]]*)\]", d.get("linked_data", ""))
    return m
# coordinates live in the S197 maps migration (same OpenBible load the app serves)
mp = {}
for m in re.finditer(r"\('([0-9a-f]{7})', '((?:[^']|'')*)', (-?[\d.]+), (-?[\d.]+)",
                     (ROOT / "data-schema/migrations/session197_maps_load.sql").read_text()):
    mp[m.group(2).replace("''", "'")] = (m.group(1), float(m.group(4)), float(m.group(3)))

def km(a, b):
    la1, lo1, la2, lo2 = map(math.radians, (a[0], a[1], b[0], b[1]))
    h = math.sin((la2-la1)/2)**2 + math.cos(la1)*math.cos(la2)*math.sin((lo2-lo1)/2)**2
    return 6371 * 2 * math.asin(math.sqrt(h))

pin_ok = pin_tot = 0; held_pins = []
for e in ents.values():
    if e["kind"] != "place":
        continue
    e["pin"] = None
    name = (e["ob_name"] or "").replace("_", " ")
    if not name or name not in mp:
        continue
    pin_tot += 1
    pid, lat, lon = mp[name]
    if e["tipnr_coords"] and km(e["tipnr_coords"], (lat, lon)) <= 30:
        e["pin"] = {"maps_place_id": pid, "lat": lat, "lon": lon}; pin_ok += 1
    else:
        why = "no TIPNR coordinate" if not e["tipnr_coords"] else \
              "TIPNR and OpenBible disagree by %.0f km" % km(e["tipnr_coords"], (lat, lon))
        held_pins.append((e["slug"], name, why))

# ---------- hand-held links ----------
# Yahusha (Jesus) is the Son of the Father; Joseph was his father only "as was supposed"
# (Luke 3:23). The tree never draws Joseph as his parent.
HOLD_LINKS = {("jesus-isa-7-14-rev", "joseph-mat-1-16-jhn"), ("joseph-mat-1-16-jhn", "jesus-isa-7-14-rev")}
links = [l for l in links if (l["slug"], l["other"]) not in HOLD_LINKS]
held_links += [(a, "parent/child", b, "held by hand: Luke 3:23, 'as was supposed'") for a, b in sorted(HOLD_LINKS)]

# ---------- restored names (voice skill: restored name with the English in parentheses) ----------
RESTORED = {"Jesus": "Yahusha (Jesus)", "Israel": "Yashar'el (Israel)", "Judah": "Yahudah (Judah)",
            "Melchizedek": "Melek Tsadiq (Melchizedek)", "Christ": "Messiah (Christ)"}
for e in ents.values():
    if e.get("name") in RESTORED:
        e["name"] = RESTORED[e["name"]]

# ---------- ship set ----------
ship = {s: e for s, e in ents.items() if e["verified_refs"]}
links = [l for l in links if l["slug"] in ship and l["other"] in ship]

data = {"people": [], "places": [], "links": links}
for e in ship.values():
    row = {"slug": e["slug"], "kind": e["kind"], "type": e["type"], "name": e["name"],
           "names": e["names"], "original": e["original"], "uncertain": e["uncertain"],
           "refs": ["%s.%d.%d" % k for k in sorted(e["verified_refs"], key=lambda k: (BOOK_ORDER.index(k[0]), k[1], k[2]))]}
    if e["kind"] == "place":
        row["pin"] = e.get("pin")
        data["places"].append(row)
    else:
        data["people"].append(row)
OUT.mkdir(exist_ok=True)
(OUT / "people_places.json").write_text(json.dumps(data, ensure_ascii=False))

# ---------- report ----------
R = []
R.append("# S472 — People & places verification report\n")
R.append("Checked against the live app text (audio-text/canon_live.json). Only what the text confirms ships; everything below was HELD.\n")
R.append(f"- Entries parsed: {len(ents)} (people {sum(1 for e in ents.values() if e['kind']=='person')}, groups {sum(1 for e in ents.values() if e['kind']=='group')}, places {sum(1 for e in ents.values() if e['kind']=='place')})")
R.append(f"- Shipping (at least one confirmed verse): {len(ship)}")
R.append(f"- Verse occurrences confirmed: {sum(book_ok.values())} of {sum(book_tot.values())}")
R.append(f"- Family links confirmed: {sum(link_ok.values())} of {sum(link_tot.values())} " +
         "(" + ", ".join(f"{k} {link_ok[k]}/{link_tot[k]}" for k in link_tot) + ")")
R.append(f"- Map pins confirmed (TIPNR and OpenBible within 30 km): {pin_ok} of {pin_tot}\n")
why_ct = collections.Counter(w.split(":")[0] if w.startswith("held by hand") else w for b in held_refs for _, _, w in held_refs[b])
R.append("- Held verse occurrences by reason: " + "; ".join(f"{k} {v}" for k, v in why_ct.most_common()) + "\n")
R.append("## Per book — verse occurrences\n\n| Book | Confirmed | Held | % |\n|---|---|---|---|")
for b in BOOK_ORDER:
    t = book_tot[b]
    if t:
        R.append(f"| {b} | {book_ok[b]} | {t-book_ok[b]} | {100*book_ok[b]/t:.1f} |")
R.append("\n## Held verse occurrences (name not found in our verse)\n")
for b in BOOK_ORDER:
    for slug, key, why in held_refs.get(b, []):
        v = VERSE.get(key, "")
        R.append(f"- {key[0]} {key[1]}:{key[2]} — {ents[slug]['forms'][:3]} — {why} — “{v[:140]}”")
R.append(f"\n## Confirmed by spelling variant ({len(variant_hits)}) — check these\n")
for slug, key, base, var in variant_hits:
    R.append(f"- {key[0]} {key[1]}:{key[2]} — TIPNR {base!r} ~ our text {var!r}")
R.append("\n## Held family links\n")
for s, rel, o, why in held_links:
    R.append(f"- {s} —{rel}→ {o}: {why}")
R.append("\n## Held map pins\n")
for s, n, why in held_pins:
    R.append(f"- {s} ({n}): {why}")
(OUT / "S472_VERIFY_REPORT.md").write_text("\n".join(R))

# ---------- migration ----------
def q(s):
    return "NULL" if s is None else "'" + str(s).replace("'", "''") + "'"
def arr(xs):
    return "ARRAY[" + ",".join(q(x) for x in xs) + "]::TEXT[]" if xs else "'{}'::TEXT[]"
S = ["-- S472 — People & places (Study Notes). Built by _s472_people_places_build.py.",
     "-- Structure from STEPBible TIPNR (CC BY 4.0); pins from OpenBible (CC BY 4.0, maps_places).",
     "-- Every verse and family link here was confirmed against the live app text. No outside",
     "-- descriptions are loaded; the 'who this was' blurb column stays empty until Yoshi approves one.",
     "-- Re-runnable: tables are rebuilt from scratch.", "", "BEGIN;",
     "DROP TABLE IF EXISTS pp_refs; DROP TABLE IF EXISTS pp_links; DROP TABLE IF EXISTS pp_entities;",
     """CREATE TABLE pp_entities (
    slug          TEXT PRIMARY KEY,
    kind          TEXT NOT NULL,            -- person / group / place
    type          TEXT,                     -- Male / Female / Group / Place
    name          TEXT NOT NULL,            -- the form our own text uses most
    names         TEXT[] NOT NULL DEFAULT '{}',
    original      TEXT,                     -- Hebrew / Greek form
    uncertain     BOOLEAN NOT NULL DEFAULT FALSE,
    blurb         TEXT,                     -- Yoshi-approved only; NULL until then
    maps_place_id TEXT,
    lat           DOUBLE PRECISION,
    lon           DOUBLE PRECISION,
    ref_count     INT NOT NULL DEFAULT 0
);""",
     """CREATE TABLE pp_links (
    slug   TEXT NOT NULL REFERENCES pp_entities(slug) ON DELETE CASCADE,
    rel    TEXT NOT NULL,                   -- parent / child / spouse / sibling
    other  TEXT NOT NULL REFERENCES pp_entities(slug) ON DELETE CASCADE,
    flags  TEXT NOT NULL DEFAULT '',        -- a = ancestor not parent, d = descended group, ? = ambiguous, f = founder
    proof  TEXT,                            -- a verse that names both
    PRIMARY KEY (slug, rel, other)
);""",
     """CREATE TABLE pp_refs (
    slug      TEXT NOT NULL REFERENCES pp_entities(slug) ON DELETE CASCADE,
    book_slug TEXT NOT NULL,
    chapter   INT NOT NULL,
    verse     INT NOT NULL,
    ord       INT NOT NULL,                 -- canon order: book * 1000000 + chapter * 1000 + verse
    PRIMARY KEY (slug, book_slug, chapter, verse)
);""",
     "CREATE INDEX idx_pp_refs_verse ON pp_refs(book_slug, chapter, verse);",
     "CREATE INDEX idx_pp_entities_name ON pp_entities(lower(name));", ""]
rows = []
for r in data["people"] + data["places"]:
    pin = r.get("pin") or {}
    rows.append(f"({q(r['slug'])},{q(r['kind'])},{q(r['type'])},{q(r['name'])},{arr(r['names'])},"
                f"{q(r['original'])},{'TRUE' if r['uncertain'] else 'FALSE'},{q(pin.get('maps_place_id'))},"
                f"{pin.get('lat','NULL') if pin else 'NULL'},{pin.get('lon','NULL') if pin else 'NULL'},{len(r['refs'])})")
for i in range(0, len(rows), 500):
    S.append("INSERT INTO pp_entities (slug,kind,type,name,names,original,uncertain,maps_place_id,lat,lon,ref_count) VALUES\n  " + ",\n  ".join(rows[i:i+500]) + ";")
lr = [f"({q(l['slug'])},{q(l['rel'])},{q(l['other'])},{q(l['flags'])},{q(l['proof'])})" for l in links]
for i in range(0, len(lr), 1000):
    S.append("INSERT INTO pp_links (slug,rel,other,flags,proof) VALUES\n  " + ",\n  ".join(lr[i:i+1000]) + ";")
rr = []
for r in data["people"] + data["places"]:
    for ref in r["refs"]:
        b, c, v = ref.rsplit(".", 2)
        rr.append(f"({q(r['slug'])},{q(b)},{c},{v},{(BOOK_ORDER.index(b)+1)*1000000+int(c)*1000+int(v)})")
for i in range(0, len(rr), 2000):
    S.append("INSERT INTO pp_refs (slug,book_slug,chapter,verse,ord) VALUES\n  " + ",\n  ".join(rr[i:i+2000]) + ";")
S += ["", "DO $$ DECLARE a INT; b INT; c INT; BEGIN",
      "  SELECT COUNT(*) INTO a FROM pp_entities; SELECT COUNT(*) INTO b FROM pp_links; SELECT COUNT(*) INTO c FROM pp_refs;",
      f"  IF a <> {len(rows)} OR b <> {len(lr)} OR c <> {len(rr)} THEN RAISE EXCEPTION 'S472 counts off: % % %', a, b, c; END IF;",
      "  RAISE NOTICE 'S472 people & places: % entries, % links, % verse rows', a, b, c; END $$;",
      "COMMIT;"]
SQL.write_text("\n".join(S) + "\n")

print(f"parsed {len(ents)}; shipping {len(ship)} (people {len(data['people'])}, places {len(data['places'])})")
print(f"verses confirmed {sum(book_ok.values())}/{sum(book_tot.values())}; missing verse keys {missing_verse}")
print("links", {k: f"{link_ok[k]}/{link_tot[k]}" for k in link_tot}, "shipped", len(links))
print(f"pins {pin_ok}/{pin_tot}")
