#!/usr/bin/env python3
"""S473 — Tribe & nation pages, added on top of S472 people & places.

Runs the S472 builder in-process (nothing it writes is kept), then:
  * builds the tribe pages (the sons of Ya'aqov / Jacob, plus Ephraim and Manasseh),
    a page for Yashar'el (Israel) as a people, and pages for the named nations;
  * lands the 4,429 tribe/nation verses S472 held off the fathers' own pages;
  * gives Jacob back the verses where the man himself is named ("Abraham, Isaac, and Jacob");
  * clears Javan's page of Paul's Greek / Gentile verses (TIPNR folded them into the man);
  * moves "Egyptians", "Moabites", "Levites"... off place pages where the place itself
    is not named in the verse (the people have their own page now).

Every verse on every new page is checked against the live app text: the verse must
carry the tribe's or nation's name. Sections on each page are by the words the verse
uses ("the children of Yashar'el", "the house of Yashar'el", "Levites"...) — the text's
own phrasing, nothing interpreted. "Gentiles" / "heathen" / "nations" verses are NOT
placed on any page (held for Yoshi).

Outputs (superset of S472 — one full rebuild):
  people-places/people_places.json
  people-places/S473_TRIBES_NATIONS_REPORT.md
  data-schema/migrations/session473_people_places.sql
"""
import collections, contextlib, io, json, pathlib, re, runpy

ROOT = pathlib.Path(__file__).resolve().parent
_w = pathlib.Path.write_text
pathlib.Path.write_text = lambda self, *a, **k: None
with contextlib.redirect_stdout(io.StringIO()):
    NS = runpy.run_path(str(ROOT / "_s472_people_places_build.py"))
pathlib.Path.write_text = _w

VERSE, HOLD, ents, data, links = NS["VERSE"], NS["HOLD"], NS["ents"], NS["data"], NS["links"]
BOOK_ORDER = NS["BOOK_ORDER"]
OUT = ROOT / "people-places"
SQL = ROOT / "data-schema/migrations/session473_people_places.sql"

def key_of(s):
    b, c, v = s.rsplit(".", 2)
    return (b, int(c), int(v))
def ref_of(k):
    return "%s.%d.%d" % k
def canon_sort(keys):
    return sorted(set(keys), key=lambda k: (BOOK_ORDER.index(k[0]), k[1], k[2]))

rows = {r["slug"]: r for r in data["people"] + data["places"]}
report = []   # (section, line)

YI = r"Yashar['’]el"
YH = r"Yahudah"

# ---------------------------------------------------------------- the man, not the people
# Patriarch lists ("Abraham, Isaac, and Jacob") and a few verses where the man himself
# acts are Jacob's own, not the people's.
JACOB = "israel-gen-25-26-rev"
MAN_ONLY = {("1-samuel", 12, 8), ("joshua", 24, 4), ("joshua", 24, 32), ("psalms", 105, 23)}
MAN_TOO = {("malachi", 1, 2), ("romans", 9, 13), ("obadiah", 1, 10), ("micah", 7, 20), ("hosea", 12, 2)}
def patriarch_list(v):
    return "Abraham" in v and "Isaac" in v and re.search(r"Jacob|" + YI, v)
jacob_back, jacob_people = [], []
for (s, k), why in HOLD.items():
    if s != JACOB or "tribe" not in why or k not in VERSE:
        continue
    v = VERSE[k]
    if not re.search(r"Jacob|" + YI + r"|Israel", v):
        continue
    if k in MAN_ONLY or (patriarch_list(v) and not re.search(r"(children|house|tribes|people|elders|congregation|men) of " + YI, v)):
        jacob_back.append(k)
    elif k in MAN_TOO:
        jacob_back.append(k); jacob_people.append(k)
    else:
        jacob_people.append(k)
jr = rows[JACOB]
jr["refs"] = [ref_of(k) for k in canon_sort([key_of(x) for x in jr["refs"]] + jacob_back)]

# ---------------------------------------------------------------- æ spellings (Judæa, Cæsarea...)
# S472's name check missed verses our text spells with æ. Recheck those held verses.
ae_back = collections.Counter()
form_in = NS["form_in"]
for e in ents.values():
    if e["slug"] not in rows:
        continue
    have = set(key_of(x) for x in rows[e["slug"]]["refs"])
    add = []
    for k in e["refs"]:
        if k in have or k not in VERSE or (e["slug"], k) in HOLD or "æ" not in VERSE[k].lower():
            continue
        t = VERSE[k].replace("æ", "e").replace("Æ", "E")
        tt = VERSE[k].replace("æ", "ae").replace("Æ", "Ae")
        if any(re.search(r"\b" + re.escape(f) + r"(s|'s)?\b", x) for f in e["forms"] for x in (t, tt)):
            add.append(k)
    if add:
        ae_back[e["slug"]] += len(add)
        rows[e["slug"]]["refs"] = [ref_of(k) for k in canon_sort([key_of(y) for y in rows[e["slug"]]["refs"]] + add)]

# ---------------------------------------------------------------- page definitions
def secs(nm, gent_label=None, gent_re=None, extra=()):
    """Sections in display order: (label, regex). First match wins."""
    out = [("The tribe of %s" % nm[0], r"(half )?tribes? of " + nm[1]),
           ("The house of %s" % nm[0], r"house of " + nm[1]),
           ("The children of %s" % nm[0], r"(children|sons|families|men|daughters|son|man) of " + nm[1])]
    if gent_re:
        out.append((gent_label, gent_re))
    out += list(extra)
    out.append(("The land and cities of %s" % nm[0],
                r"(land|cities|city|border|borders|coast|coasts|lot|inheritance|mount|mountains|wilderness|country|towns) of " + nm[1]))
    return out

# (slug, display name, names, father slug, bare regex, gentilic regex, gentilic label, extra sections)
TRIBES = [
 ("tribe-reuben", "Reuben", "reuben-gen-29-32-rev", r"\bReuben\b", r"\bReubenites?\b", "Reubenites"),
 ("tribe-simeon", "Simeon", "simeon-gen-29-33-rev", r"\bSimeon\b", r"\bSimeonites?\b", "Simeonites"),
 ("tribe-levi", "Levi", "levi-gen-29-34-rev", r"\bLevi\b", r"\bLevites?\b|\bLevitical\b", "Levites"),
 ("tribe-yahudah", "Yahudah (Judah)", "judah-gen-29-35-rev", YH + r"|\bJuda\b", r"\bYahudim\b|\bYahudi\b|\bJewess\b|\bJewry\b|\bJews?\b|\bJEWS\b", "Yahudim (Jews)"),
 ("tribe-dan", "Dan", "dan-gen-30-6-1ch", r"\bDan\b", r"\bDanites?\b", "Danites"),
 ("tribe-naphtali", "Naphtali", "naphtali-gen-30-8-rev", r"\bNaphtali\b|\bNepthalim\b|\bNephthalim\b", None, None),
 ("tribe-gad", "Gad", "gad-gen-30-11-rev", r"\bGad\b", r"\bGadites?\b", "Gadites"),
 ("tribe-asher", "Asher", "asher-gen-30-13-rev", r"\bAsher\b|\bAser\b", r"\bAsherites?\b", "Asherites"),
 ("tribe-issachar", "Issachar", "issachar-gen-30-18-rev", r"\bIssachar\b", None, None),
 ("tribe-zebulun", "Zebulun", "zebulun-gen-30-20-rev", r"\bZebulun\b|\bZabulon\b", r"\bZebulonites?\b|\bZebulunites?\b", "Zebulonites"),
 ("tribe-joseph", "Joseph", "joseph-gen-30-24-rev", r"\bJoseph\b", None, None),
 ("tribe-ephraim", "Ephraim", "ephraim-gen-41-52-zec", r"\bEphraim\b", r"\bEphraimites?\b", "Ephraimites"),
 ("tribe-manasseh", "Manasseh", "manasseh-gen-41-51-rev", r"\bManasseh\b|\bManasses\b", r"\bManassites?\b", "Manassites"),
 ("tribe-benjamin", "Benjamin", "benjamin-gen-35-18-rev", r"\bBenjamin\b", r"\bBenjamites?\b", "Benjamites"),
]
PEOPLE = ("people-yasharel", "Yashar'el (Israel)")
PEOPLE_BARE = YI + r"|\bIsraelites?\b|\bJacob\b|\bJeshurun\b|\bJesurun\b"
PEOPLE_SECS = [
    ("The children of Yashar'el (Israel)", r"children of " + YI),
    ("The house of Yashar'el (Israel)", r"house of " + YI),
    ("The tribes of Yashar'el (Israel)", r"tribes of " + YI),
    ("Israelites", r"\bIsraelites?\b"),
    ("The Elohim (God) of Yashar'el (Israel)",
     r"(Elohim|El Gibbor|Holy One|Mighty One|Rock|Shepherd|Hope|Redeemer|Strength|Glory|Light|Saviour)( \([^)]*\))? of (" + YI + r"|Jacob)"),
    ("King of Yashar'el (Israel)", r"[Kk]ings? of " + YI),
    ("Jacob, the name the people carry", r"\bJacob\b(?![^.;:]*" + YI + ")"),
    ("Jeshurun", r"\bJeshurun\b|\bJesurun\b"),
]

# Named nations: (slug, name, names, gentilic regex, land place slug, exclude regex)
NATIONS = [
 ("nation-egyptians", "Egyptians", ["Egyptians", "Egyptian"], r"\bEgyptians?\b", "egypt-gen-12-10-rev", None),
 ("nation-canaanites", "Canaanites", ["Canaanites", "Canaanite"], r"\bCanaanites?\b|\bCanaanitess\b|\bCanaanitish\b", "canaan-gen-10-18-act", None),
 ("nation-hittites", "Hittites", ["Hittites", "Hittite", "sons of Heth"], r"\bHittites?\b|\b(sons|children|daughters) of Heth\b", None, None),
 ("nation-moabites", "Moabites", ["Moabites", "Moabite", "Moabitess"], r"\bMoabites?\b|\bMoabitess\b|\bchildren of Moab\b", "moab-gen-19-37b-zep", None),
 ("nation-ammonites", "Ammonites", ["Ammonites", "Ammonite", "children of Ammon"], r"\bAmmonites?\b|\bAmmonitess\b|\bchildren of Ammon\b", "ammon-gen-19-38-zep", None),
 ("nation-edomites", "Edomites", ["Edomites", "Edomite"], r"\bEdomites?\b|\bchildren of Edom\b", "edom-gen-32-3-mal", None),
 ("nation-philistines", "Philistines", ["Philistines", "Philistine"], r"\bPhilistines?\b|\bPhilistim\b", None, None),
 ("nation-midianites", "Midianites", ["Midianites", "Midianite"], r"\bMidianites?\b|\bMidianitish\b|\bMadianites?\b", "midian-gen-36-35-act", None),
 ("nation-amalekites", "Amalekites", ["Amalekites", "Amalekite"], r"\bAmalekites?\b", "amalek-gen-14-7-psa", None),
 ("nation-ishmaelites", "Ishmaelites", ["Ishmaelites", "Ishmeelites"], r"\bIshmaelites?\b|\bIshmeelites?\b", None, None),
 ("nation-syrians", "Syrians", ["Syrians", "Syrian"], r"\bSyrians?\b", "syria-jdg-10-6-gal", None),
 ("nation-assyrians", "Assyrians", ["Assyrians", "Assyrian"], r"\bAssyrians?\b", "assyria-gen-2-14-zec", None),
 ("nation-chaldeans", "Chaldeans", ["Chaldeans", "Chaldees"], r"\bChaldeans?\b|\bChaldæans\b|(?<!Ur of the )\bChaldees\b", "chaldea-gen-11-28-act", None),
 ("nation-babylonians", "Babylonians", ["Babylonians"], r"\bBabylonians?\b", "babylon-gen-10-10-rev", None),
 ("nation-persians", "Persians", ["Persians", "Persian"], r"\bPersians?\b", "persia-2ch-36-20-dan", None),
 ("nation-medes", "Medes", ["Medes", "Mede", "Median"], r"\bMedes?\b|\bMedian\b", None, None),
 ("nation-greeks", "Greeks", ["Greeks", "Greek", "Grecians"], r"\bGreeks?\b|\bGrecians?\b",
  None, r"\bGreek tongue\b|\bin Greek\b|\bspeak Greek\b|\bof Greek\b|\bHebrew, and Greek\b"),
 ("nation-romans", "Romans", ["Romans", "Roman"], r"\bRomans?\b", None, None),
 ("nation-samaritans", "Samaritans", ["Samaritans", "Samaritan"], r"\bSamaritans?\b", "samaria-1ki-13-32-act", None),
 ("nation-ethiopians", "Ethiopians", ["Ethiopians", "Ethiopian"], r"\bEthiopians?\b", None, None),
 ("nation-arabians", "Arabians", ["Arabians", "Arabian"], r"\bArabians?\b", None, None),
]
# Existing S472 people-groups that belong in the "peoples" list too.
EXISTING_NATIONS = ["amorites-gen-10-16-amo", "jebusites-gen-10-16-zec", "hivites-gen-10-17-2ch",
                    "perizzites-gen-13-7-neh", "girgashite-gen-10-16-neh", "kenite-gen-15-19-1ch",
                    "kenizzites-gen-15-19", "kadmonites-gen-15-19", "rephaim-gen-14-5-jos",
                    "emim-gen-14-5-deu", "caphtorim-gen-10-14-1ch", "parthians-act-2-9", "scythians-col-3-11"]
NOT_PLACED = r"\bGentiles?\b|\bheathen\b|\bnations\b"

# ---------------------------------------------------------------- build pages
pages = {}     # slug -> dict
def new_page(slug, kind, typ, name, names, browse, bord):
    pages[slug] = {"slug": slug, "kind": kind, "type": typ, "name": name, "names": names,
                   "original": None, "uncertain": False, "browse": browse, "browse_ord": bord,
                   "refs": {}, "sections": []}
    return pages[slug]

def place(page, keys, sections, fallback, must):
    labels = [l for l, _ in sections] + [fallback]
    page["sections"] = labels
    held = []
    for k in canon_sort(keys):
        v = VERSE.get(k)
        if v is None:
            held.append((k, "verse not in app text")); continue
        if not re.search(must, v):
            held.append((k, "name not in our verse")); continue
        idx = next((i for i, (_, rx) in enumerate(sections) if re.search(rx, v)), len(sections))
        page["refs"][k] = idx
    return held

held_tribe_refs = collections.defaultdict(set)
for (s, k), why in HOLD.items():
    if "tribe" in why:
        held_tribe_refs[s].add(k)

def scan(rx, skip_genesis=True, exclude=None):
    out = []
    for k, v in VERSE.items():
        if skip_genesis and k[0] == "genesis":
            continue
        if re.search(rx, v) and not (exclude and re.search(exclude, v)):
            out.append(k)
    return out

new_held = []
# Yashar'el, the people
p = new_page(PEOPLE[0], "group", "Nation", PEOPLE[1],
             ["Yashar'el (Israel)", "Israel", "Israelites", "children of Israel", "house of Israel", "Jacob", "Jeshurun"],
             "people", 0)
cand = set(jacob_people) | {k for k in held_tribe_refs[JACOB] if k not in jacob_back} | \
       set(scan(r"\bIsraelites?\b|(children|house|tribes) of " + YI))
cand -= {k for k in jacob_back if k not in MAN_TOO}
for k, why in place(p, cand, PEOPLE_SECS, "Yashar'el (Israel) named", PEOPLE_BARE):
    new_held.append((PEOPLE[0], k, why))

# the tribes
for i, (slug, nm, father, bare, gent, glabel) in enumerate(TRIBES):
    in_text = nm.split(" (")[0]
    rx_name = bare.replace(r"\b", "") if False else bare
    extra = [("Kings of Yahudah (Judah)", r"[Kk]ings? of " + YH)] if slug == "tribe-yahudah" else []
    names = [nm] + ([glabel] if glabel else []) + ["tribe of %s" % in_text]
    if slug == "tribe-yahudah":
        names = ["Yahudah (Judah)", "Judah", "Yahudim (Jews)", "Jews", "Jew", "tribe of Judah", "house of Judah"]
    p = new_page(slug, "tribe", "Tribe", nm, names, "tribe", i + 1)
    phrase = r"(half tribe|tribes?|children|house|families|sons) of (" + bare + ")"
    cand = set(held_tribe_refs[father]) | {k for k in scan(phrase) if not NS["the_man_in_view"](k)}
    if gent:
        cand |= set(scan(gent, skip_genesis=False))
    nm_rx = "(" + bare + ")"
    for k, why in place(p, cand, secs((nm, nm_rx), glabel, gent, extra),
                        "%s named" % nm, bare + ("|" + gent if gent else "")):
        new_held.append((slug, k, why))

# The man himself in a tribe verse: "the son of Levi", "Manasseh the son of Joseph", "the bones
# of Joseph", "the sons of Yahudah; Er, and Onan" in the family-list chapters. These stay on the
# tribe page and also go back on the man's own page (S472 held them as tribe usages).
GEN_CH = NS["GENEALOGY_CHAPTERS"]
man_back = collections.Counter()
for slug, nm, father, bare, gent, glabel in TRIBES:
    b = "(" + bare + ")"
    man_rx = r"\bson of " + b + r"|" + b + r",? the son of|\bbones of " + b + r"|Tamar bare unto " + b
    fr = rows[father]
    have = set(key_of(x) for x in fr["refs"])
    add = []
    for k in held_tribe_refs[father]:
        v = VERSE.get(k)
        if v is None or k in have:
            continue
        if re.search(man_rx, v) or ((k[0], k[1]) in GEN_CH and re.search(r"\bsons of " + b, v)) \
                or (father == "joseph-gen-30-24-rev" and k == ("psalms", 105, 17)):
            add.append(k)
    if add:
        man_back[nm] = len(add)
        fr["refs"] = [ref_of(k) for k in canon_sort(list(have) + add)]

# the nations
for i, (slug, nm, names, gent, land, excl) in enumerate(NATIONS):
    p = new_page(slug, "group", "Nation", nm, names, "nation", 100 + i)
    for k, why in place(p, scan(gent, skip_genesis=False, exclude=excl), [], "%s named" % nm, gent):
        new_held.append((slug, k, why))

# ---------------------------------------------------------------- fixes to S472 pages
# Javan: the son of Japheth, not Paul's Greeks or Gentiles.
jv = rows["javan-gen-10-2-col"]
keep, javan_out = [], []
for x in jv["refs"]:
    (keep if re.search(r"\bJavan\b", VERSE[key_of(x)]) else javan_out).append(x)
jv["refs"], jv["names"], jv["name"] = keep, ["Javan"], "Javan"
gentile_held = [key_of(x) for x in javan_out if key_of(x) not in pages["nation-greeks"]["refs"]]

# Judea and "Hebrew" verses TIPNR folded under the man Judah go to their own pages.
moved_judea = moved_hebrew = 0
for k in held_tribe_refs["judah-gen-29-35-rev"]:
    v = VERSE.get(k, "")
    for slug, rx in (("judea-ezr-9-9-1th", r"\bJud(e|æ|ae)a\b"), ("hebrews-gen-14-13-heb", r"\bHebrews?\b")):
        if slug in rows and re.search(rx, v) and ref_of(k) not in rows[slug]["refs"]:
            rows[slug]["refs"] = [ref_of(x) for x in canon_sort([key_of(y) for y in rows[slug]["refs"]] + [k])]
            if slug.startswith("judea"): moved_judea += 1
            else: moved_hebrew += 1

# Judea: TIPNR folds Galilee and Judah into its Judea record, and the name shown came out
# as "Galilee". The page keeps only verses that name Judea (Judæa) or Jewry.
jd = rows["judea-ezr-9-9-1th"]
judea_off = [x for x in jd["refs"] if not re.search(r"\bJud(e|æ|ae)a\b|\bJewry\b", VERSE[key_of(x)])]
jd["refs"] = [x for x in jd["refs"] if x not in judea_off]
jd["name"], jd["names"] = "Judea", ["Judea", "Judæa", "Jewry"]

# Place pages: a verse that names only the people ("the Egyptians", "the Danites") and
# not the place itself now lives on the people's page.
claim = {}
for pg in pages.values():
    for k in pg["refs"]:
        claim.setdefault(k, []).append(pg["slug"])
ALL_GENT = "|".join(n[3] for n in NATIONS) + "|" + "|".join(t[4] for t in TRIBES if t[4]) + r"|\bIsraelites?\b"
STRIP = {"Jewry", "Chaldee", "Aramean", "Syrian", "Hebrew", "Greek", "Gentile", "Greek,Gentile", "Judean"}
GENTILIC = NS["GENTILIC"]
def bare_in(forms, text):
    t = " " + re.sub(r"[^a-z0-9' ]", " ", re.sub(r"[-‐-―]", " ", text.lower().replace("’", "'"))) + " "
    t = re.sub(r"\s+", " ", t)
    for f in forms:
        f = re.sub(r"\s+", " ", re.sub(r"[^a-z0-9' ]", " ", f.lower())).strip()
        if f and (f" {f} " in t or f" {f}'s " in t or f" {f}' " in t or f" {f}s " in t or f" {f}es " in t
                  or (f.replace(" ", "") != f and f" {f.replace(' ', '')} " in t)):
            return True
    return False
moved_off = collections.Counter()
KEEP_PLACE = {"egypt-sea-isa-11-15"}   # "the Egyptian sea" is a place
for r in data["places"]:
    e = ents[r["slug"]]
    forms = [f for f in e["forms"] if f not in STRIP and "," not in f]
    keep = []
    if r["slug"] in KEEP_PLACE:
        continue
    for x in r["refs"]:
        k = key_of(x)
        if k in claim and not bare_in(forms, re.sub(ALL_GENT, " ", VERSE[k].replace("æ", "e"))):
            moved_off[r["slug"]] += 1
            continue
        keep.append(x)
    r["refs"] = keep
    if moved_off[r["slug"]] and keep:
        # the name shown is the form the remaining verses use most
        cnt = collections.Counter()
        for x in keep:
            t = VERSE[key_of(x)].replace("æ", "e")
            for f in forms:
                if bare_in([f], t):
                    cnt[f] += 1
        if cnt:
            r["names"] = [n for n, _ in cnt.most_common()]
            r["name"] = r["names"][0]

# ---------------------------------------------------------------- links between pages
newlinks = []
def L(a, rel, b, proof=None):
    if a in rows or a in pages:
        if b in rows or b in pages:
            newlinks.append({"slug": a, "rel": rel, "other": b, "flags": "", "proof": proof})
for slug, nm, father, *_ in TRIBES:
    L(slug, "founder", father); L(father, "tribe", slug)
    L(PEOPLE[0], "tribe", slug); L(slug, "whole", PEOPLE[0])
L(PEOPLE[0], "founder", JACOB); L(JACOB, "tribe", PEOPLE[0])
L("tribe-joseph", "tribe", "tribe-ephraim"); L("tribe-joseph", "tribe", "tribe-manasseh")
L(PEOPLE[0], "also", "hebrews-gen-14-13-heb")
L("tribe-yahudah", "land", "judea-ezr-9-9-1th"); L("judea-ezr-9-9-1th", "nation", "tribe-yahudah")
for slug, nm, names, gent, land, excl in NATIONS:
    if land:
        L(slug, "land", land); L(land, "nation", slug)
for a, b in (("nation-philistines", "philistia-gen-21-32-zec"), ("nation-ethiopians", "cush-gen-2-13-act"),
             ("nation-medes", "media-2ki-17-6-act"), ("nation-romans", "rome-jhn-11-48-phm"),
             ("nation-greeks", "greece-isa-66-19-act"), ("nation-arabians", "arabia-2sa-23-35-gal")):
    L(a, "land", b); L(b, "nation", a)
L("nation-ishmaelites", "founder", "ishmael-gen-16-11-psa"); L("ishmael-gen-16-11-psa", "nation", "nation-ishmaelites")

# ---------------------------------------------------------------- assemble
for r in rows.values():
    r.setdefault("browse", None); r.setdefault("browse_ord", None)
for i, s in enumerate(EXISTING_NATIONS):
    if s in rows:
        rows[s]["browse"], rows[s]["browse_ord"] = "nation", 200 + i
empty = [s for s, pg in pages.items() if not pg["refs"]]
out_people = [r for r in data["people"] if r["refs"]]
out_places = [r for r in data["places"] if r["refs"]]
dropped_rows = [r["slug"] for r in data["people"] + data["places"] if not r["refs"]]
out_groups = []
for pg in pages.values():
    if not pg["refs"]:
        continue
    ks = canon_sort(pg["refs"].keys())
    out_groups.append({k2: pg[k2] for k2 in ("slug", "kind", "type", "name", "names", "original", "uncertain", "browse", "browse_ord")}
                      | {"refs": [ref_of(k) for k in ks], "ref_sections": [pg["refs"][k] for k in ks],
                         "sections": pg["sections"], "pin": None})
live = {r["slug"] for r in out_people + out_places + out_groups}
all_links = [l for l in links + newlinks if l["slug"] in live and l["other"] in live]
all_links = list({(l["slug"], l["rel"], l["other"]): l for l in all_links}.values())
final = {"people": out_people, "places": out_places, "groups": out_groups, "links": all_links}
(OUT / "people_places.json").write_text(json.dumps(final, ensure_ascii=False))

# ---------------------------------------------------------------- report
R = ["# S473 — Tribe & nation pages: verification report\n",
     "Built on top of S472 (people & places). Every verse on a tribe or nation page was checked against",
     "the live app text (audio-text/canon_live.json): the verse must carry the tribe's or nation's name.",
     "Sections follow the words the verse itself uses. Nothing interpreted, no outside descriptions.\n"]
held_total = sum(len(v) for v in held_tribe_refs.values())
placed_from_held = sum(1 for s, ks in held_tribe_refs.items() for k in ks
                       if any(k in pages[p]["refs"] for p in pages) or k in jacob_back)
R.append(f"- Verses S472 held off the fathers' pages: {held_total}; now on a page: {placed_from_held}")
R.append(f"- Jacob's own page given back {len(jacob_back)} verses where the man is named (patriarch lists, 1 Sam 12:8, Josh 24:4/32, Ps 105:23; Mal 1:2, Rom 9:13, Obad 1:10, Mic 7:20, Hos 12:2 on both)")
R.append(f"- The man's own page given back verses where he himself is named inside a tribe verse (\"the son of Levi\", family-list chapters, \"the bones of Joseph\"); these stay on the tribe page too: " + ", ".join(f"{k} {v}" for k, v in man_back.most_common()))
R.append(f"- Javan's page: {len(javan_out)} verses taken off (Paul's Greeks and Gentiles); Greek verses now on the Greeks page; {len(gentile_held)} \"Gentiles\" verses held (not placed anywhere)")
R.append(f"- Verses our text spells with æ (Judæa, Cæsarea...) that S472 missed, now on their pages: {sum(ae_back.values())} (" + ", ".join(f"{s.split('-')[0]} {n}" for s, n in ae_back.most_common()) + ")")
R.append(f"- Judea place page: shown name fixed (was \"Galilee\"); {len(judea_off)} verses that name only Galilee or Yahudah taken off; gained {moved_judea}; Hebrews page gained {moved_hebrew} (verses TIPNR had folded under the man Judah)")
R.append(f"- Place pages: {sum(moved_off.values())} verses moved to the people's own page (the verse names the people, not the place): " +
         ", ".join(f"{s.split('-')[0]} {n}" for s, n in moved_off.most_common()))
if dropped_rows:
    R.append(f"- S472 entries left with no verse after the moves (dropped): {', '.join(dropped_rows)}")
if empty:
    R.append(f"- Pages with no verse (not shipped): {', '.join(empty)}")
R.append("\n## Pages\n\n| Page | Verses | Sections |\n|---|---|---|")
for g in out_groups:
    c = collections.Counter(g["ref_sections"])
    R.append(f"| {g['name']} | {len(g['refs'])} | " + "; ".join(f"{g['sections'][i]} {c[i]}" for i in range(len(g['sections'])) if c[i]) + " |")
R.append("\n## Held — not placed on any page\n")
R.append("### \"Gentiles\" verses taken off Javan's page (Yoshi's question)\n")
for k in gentile_held:
    R.append(f"- {k[0]} {k[1]}:{k[2]} — “{VERSE[k][:150]}”")
leftover = []
for s, ks in held_tribe_refs.items():
    for k in ks:
        if not any(k in pages[p]["refs"] for p in pages) and k not in jacob_back:
            leftover.append((s, k))
R.append(f"\n### S472-held verses still without a page ({len(leftover)})\n")
for s, k in sorted(leftover, key=lambda x: (BOOK_ORDER.index(x[1][0]), x[1][1], x[1][2])):
    R.append(f"- {k[0]} {k[1]}:{k[2]} — under {s} — “{VERSE.get(k, '')[:150]}”")
R.append(f"\n### Checked out of a page ({len(new_held)})\n")
for s, k, why in new_held:
    if why != "name not in our verse" or k in held_tribe_refs.get(s, ()):
        R.append(f"- {s}: {k[0]} {k[1]}:{k[2]} — {why}")
(OUT / "S473_TRIBES_NATIONS_REPORT.md").write_text("\n".join(R) + "\n")

# ---------------------------------------------------------------- migration
def q(s):
    return "NULL" if s is None else "'" + str(s).replace("'", "''") + "'"
def arr(xs):
    return "ARRAY[" + ",".join(q(x) for x in xs) + "]::TEXT[]" if xs else "'{}'::TEXT[]"
S = ["-- S473 — People & places + tribe & nation pages (Study Notes). Built by _s473_tribes_nations_build.py",
     "-- on top of _s472_people_places_build.py. Supersedes session472_people_places.sql (full rebuild).",
     "-- Every verse was confirmed against the live app text. blurb stays NULL until Yoshi approves one.",
     "", "BEGIN;",
     "DROP TABLE IF EXISTS pp_refs; DROP TABLE IF EXISTS pp_links; DROP TABLE IF EXISTS pp_entities;",
     """CREATE TABLE pp_entities (
    slug          TEXT PRIMARY KEY,
    kind          TEXT NOT NULL,            -- person / group / place / tribe
    type          TEXT,                     -- Male / Female / Group / Nation / Tribe / Place
    name          TEXT NOT NULL,
    names         TEXT[] NOT NULL DEFAULT '{}',
    original      TEXT,
    uncertain     BOOLEAN NOT NULL DEFAULT FALSE,
    blurb         TEXT,                     -- Yoshi-approved only; NULL until then
    maps_place_id TEXT,
    lat           DOUBLE PRECISION,
    lon           DOUBLE PRECISION,
    ref_count     INT NOT NULL DEFAULT 0,
    browse        TEXT,                     -- people / tribe / nation: listed on the browse screen
    browse_ord    INT,
    sections      TEXT[] NOT NULL DEFAULT '{}'  -- tribe/nation pages: section labels, in order
);""",
     """CREATE TABLE pp_links (
    slug   TEXT NOT NULL REFERENCES pp_entities(slug) ON DELETE CASCADE,
    rel    TEXT NOT NULL,   -- parent / child / spouse / sibling; founder / tribe / whole / also / land / nation
    other  TEXT NOT NULL REFERENCES pp_entities(slug) ON DELETE CASCADE,
    flags  TEXT NOT NULL DEFAULT '',
    proof  TEXT,
    PRIMARY KEY (slug, rel, other)
);""",
     """CREATE TABLE pp_refs (
    slug      TEXT NOT NULL REFERENCES pp_entities(slug) ON DELETE CASCADE,
    book_slug TEXT NOT NULL,
    chapter   INT NOT NULL,
    verse     INT NOT NULL,
    ord       INT NOT NULL,
    section   SMALLINT,                     -- index into pp_entities.sections (tribe/nation pages)
    PRIMARY KEY (slug, book_slug, chapter, verse)
);""",
     "CREATE INDEX idx_pp_refs_verse ON pp_refs(book_slug, chapter, verse);",
     "CREATE INDEX idx_pp_entities_name ON pp_entities(lower(name));", ""]
ent_rows = []
for r in out_people + out_places + out_groups:
    pin = r.get("pin") or {}
    ent_rows.append(f"({q(r['slug'])},{q(r['kind'])},{q(r['type'])},{q(r['name'])},{arr(r['names'])},"
                    f"{q(r['original'])},{'TRUE' if r['uncertain'] else 'FALSE'},{q(pin.get('maps_place_id'))},"
                    f"{pin.get('lat','NULL') if pin else 'NULL'},{pin.get('lon','NULL') if pin else 'NULL'},{len(r['refs'])},"
                    f"{q(r.get('browse'))},{r.get('browse_ord') if r.get('browse_ord') is not None else 'NULL'},{arr(r.get('sections', []))})")
for i in range(0, len(ent_rows), 500):
    S.append("INSERT INTO pp_entities (slug,kind,type,name,names,original,uncertain,maps_place_id,lat,lon,ref_count,browse,browse_ord,sections) VALUES\n  "
             + ",\n  ".join(ent_rows[i:i+500]) + ";")
lr = [f"({q(l['slug'])},{q(l['rel'])},{q(l['other'])},{q(l['flags'])},{q(l['proof'])})" for l in all_links]
for i in range(0, len(lr), 1000):
    S.append("INSERT INTO pp_links (slug,rel,other,flags,proof) VALUES\n  " + ",\n  ".join(lr[i:i+1000]) + ";")
rr = []
for r in out_people + out_places + out_groups:
    secs_ = r.get("ref_sections")
    for j, ref in enumerate(r["refs"]):
        b, c, v = ref.rsplit(".", 2)
        rr.append(f"({q(r['slug'])},{q(b)},{c},{v},{(BOOK_ORDER.index(b)+1)*1000000+int(c)*1000+int(v)},"
                  f"{secs_[j] if secs_ else 'NULL'})")
for i in range(0, len(rr), 2000):
    S.append("INSERT INTO pp_refs (slug,book_slug,chapter,verse,ord,section) VALUES\n  " + ",\n  ".join(rr[i:i+2000]) + ";")
S += ["", "DO $$ DECLARE a INT; b INT; c INT; BEGIN",
      "  SELECT COUNT(*) INTO a FROM pp_entities; SELECT COUNT(*) INTO b FROM pp_links; SELECT COUNT(*) INTO c FROM pp_refs;",
      f"  IF a <> {len(ent_rows)} OR b <> {len(lr)} OR c <> {len(rr)} THEN RAISE EXCEPTION 'S473 counts off: % % %', a, b, c; END IF;",
      "  RAISE NOTICE 'S473 people & places: % entries, % links, % verse rows', a, b, c; END $$;",
      "COMMIT;"]
SQL.write_text("\n".join(S) + "\n")

print(f"entries {len(ent_rows)} (people {len(out_people)}, places {len(out_places)}, tribe/nation pages {len(out_groups)}); links {len(lr)}; verse rows {len(rr)}")
print(f"held verses placed {placed_from_held}/{held_total}; Jacob back {len(jacob_back)}; Javan off {len(javan_out)}; places moved {sum(moved_off.values())}")
