"""S496 — read496_b3.py: the Fable read of the Sonnet drafts for Matthew 14–19 (batch b3). Applies the corrections below to out/matthew_<N>_draft.json and
writes out/matthew_<N>_fixed.json (the drafts stay as drafted). `{book c:v}` in a correction is filled verbatim from parsed/canon.json by
script. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, re, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
def fill(s):
    def f(m):
        t = parsed_text('canon', m.group(1), int(m.group(2)), int(m.group(3))); assert t, m.group(0); return t
    return re.sub(r"\{([a-z0-9-]+) (\d+):(\d+)\}", f, s)
E = {
 14: {
  3506: dict(prose="He prays alone on a mountain here, and the book closes on a mountain too, the one in Galilee *where Yahusha (Jesus) had appointed them*. What he began apart at evening, with the crowds sent away, he finishes by gathering the eleven on a hill and sending them out."),
 },
 15: {}, 16: {}, 17: {}, 18: {},
 19: {
  3681: dict(member_sentence="Yahuah (the LORD) tells Abram to walk before him and be perfect, long before Sinai."),
 },
}
# ch 19: the drafter's "the King" as a name for Yahusha (Jesus) — the S1xx shorthand, not how the cards speak; every bare use becomes the name
KING = {19}
def deking(s):
    s = re.sub(r"\b[Tt]he King's\b", "Yahusha's (Jesus's)", s)
    return re.sub(r"\b[Tt]he King\b", "Yahusha (Jesus)", s)
T = {}
tot = 0
for ch in range(14, 20):
    d = json.load(open(W6 / 'out' / f'matthew_{ch}_draft.json')); n = 0
    for c in d['cards']:
        for k, v in (E.get(ch, {}).get(c['id']) or {}).items(): c[k] = fill(v); n += 1
        if ch in KING:
            for k in ('prose', 'member_sentence'):
                v = deking(c[k])
                if v != c[k]: c[k] = v; n += 1
        c['prose'] = re.sub(r"\s*\n+\s*", " ", c['prose']).strip()          # a card note is one paragraph
    assert set(E.get(ch, {})) <= {c['id'] for c in d['cards']}
    for t in d.get('new_threads') or []:
        fx = T.get(ch, {}).get(t['slug']) or {}
        if 'replace' in fx:
            a, b = fx['replace']; assert a in t['summary_md']; t['summary_md'] = t['summary_md'].replace(a, b); n += 1
    d['read'] = f"Read on Claude Fable 5.1 (claude-fable-5-1), 2026-11-13: every card read against both verses and the voice standard; {n} correction(s) applied in read496_b3.py; drafted on {d['model']}."
    json.dump(d, open(W6 / 'out' / f'matthew_{ch}_fixed.json', 'w'), ensure_ascii=False, indent=1)
    print(ch, 'cards', len(d['cards']), 'corrections', n); tot += n
print('total', tot)
