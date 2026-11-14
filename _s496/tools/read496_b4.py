"""S496 — read496_b4.py: the Fable read of the Sonnet drafts for Matthew 20–24 (batch b4). Applies the corrections below to out/matthew_<N>_draft.json and
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
 20: {}, 21: {},
 22: {
  # "Keep the *like*" is the brief's instruction to the drafter leaking into the reader's prose
  3921: dict(prose="The one David bows to sits at the right hand in the psalm, and in Daniel *one like the Son of Adam* comes with the clouds to the Ancient of days and is given a kingdom that *shall not pass away* (Daniel 7:14). Daniel's word is *like*: he saw one who looked like a son of Adam, the one who would take on flesh, brought near before the Father."),
 },
 23: {},
 24: {
  # same leak: "Daniel keeps the word *like*"
  4040: dict(prose="Matthew has the Son of Adam coming on the clouds, and Daniel is the vision behind it: a figure *like* the Son of Adam, brought near before the Ancient of days. Daniel's word is *like*, for the one who comes took on flesh and looked like a son of Adam, and Daniel says what is given him: *dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him* (Daniel 7:14). Yahusha (Jesus) takes that figure as himself."),
  # "each book is read in its own words" is the rule, not something the reader needs told
  # the old note carried the author's settled reading that the catching up of 4:17 is a later thing; the drafter dropped it — the card says it plainly, verse quoted
  4057: dict(prose="Paul comforts those grieving *them which are asleep*: the hope is that *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) at his coming, at the trump of Elohim (God), the same coming in which Matthew's great trumpet gathers the scattered elect. The catching up he names after it, *Then we which are alive and remain shall be caught up together with them in the clouds* (1 Thessalonians 4:17), is a later thing, afterward, and the gathering of the elect is not it."),
  4020: dict(prose="Matthew gives the sign of the holy place and no number of months. Revelation shows *a mouth speaking great things and blasphemies*, given to the beast the dragon empowered, and *power was given unto him to continue forty and two months*. Revelation counts in months where Matthew counts nothing."),
 },
}
# new-thread summaries: the rule-echoes ("says what it says", "the cards in this thread") and the italic opener come out; "It ain't new." stays plain
T = {
 22: {'matthew-22-their-city-burned-and-the-house-left-desolate': [("*It ain't new.* ", "It ain't new. ")]},
 23: {'matthew-23-the-seat-of-moses-and-what-was-laid-on-it': [("\n\nThe cards in this thread set each of those commandments and sayings beside the verse of Matthew that stands on it.", "")]},
 24: {'matthew-24-the-abomination-of-desolation': [("Revelation is its own book and says what it says. John is given a reed and told,", "In Revelation John is given a reed and told,")],
      'matthew-24-false-christs-and-the-lightning': [("Revelation has its own supper, and it says what it says:", "Revelation has a supper of its own:")]},
}
# thread moves: a scene whose verses already sit inside a live Matthew-anchored thread gets FILLED, not given a second thread
MOVE = {20: {3721: 'the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras', 3722: 'the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras',
             3723: 'the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras', 3724: 'the-vineyard-of-yashar-el-and-the-sovereign-grace-of-the-master-in-sirach-and-2-esdras',
             3736: 'the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees', 3737: 'the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees',
             3738: 'the-cup-of-suffering-and-the-vindication-of-the-righteous-in-wisdom-of-solomon-and-2-maccabees'}}
DROP_THREADS = {20: {'matthew-20-thine-eye-evil-because-i-am-good', 'matthew-20-the-mother-and-the-sons-of-zebedee'}}   # the vineyard thread (20:1-16) and the cup thread (20:22-23) already hold these scenes
tot = 0
for ch in range(20, 25):
    d = json.load(open(W6 / 'out' / f'matthew_{ch}_draft.json')); n = 0
    for c in d['cards']:
        for k, v in (E.get(ch, {}).get(c['id']) or {}).items(): c[k] = fill(v); n += 1
        if c['id'] in MOVE.get(ch, {}): c['thread'] = MOVE[ch][c['id']]; n += 1
        c['prose'] = re.sub(r"\s*\n+\s*", " ", c['prose']).strip()          # a card note is one paragraph
    assert set(E.get(ch, {})) <= {c['id'] for c in d['cards']}
    if ch in DROP_THREADS:
        before = len(d['new_threads']); d['new_threads'] = [t for t in d['new_threads'] if t['slug'] not in DROP_THREADS[ch]]; assert before - len(d['new_threads']) == len(DROP_THREADS[ch]); n += len(DROP_THREADS[ch])
    seen = set()
    for t in d.get('new_threads') or []:
        for a, b in T.get(ch, {}).get(t['slug']) or []:
            assert a in t['summary_md'], (ch, t['slug'], a[:40]); t['summary_md'] = t['summary_md'].replace(a, b); n += 1; seen.add(t['slug'])
    assert seen == set(T.get(ch, {})), (ch, seen)
    d['read'] = f"Read on Claude Fable 5.1 (claude-fable-5-1), 2026-11-13: every card read against both verses and the voice standard; {n} correction(s) applied in read496_b4.py; drafted on {d['model']}."
    json.dump(d, open(W6 / 'out' / f'matthew_{ch}_fixed.json', 'w'), ensure_ascii=False, indent=1)
    print(ch, 'cards', len(d['cards']), 'corrections', n); tot += n
print('total', tot)
