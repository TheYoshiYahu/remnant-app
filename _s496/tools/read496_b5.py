"""S496 — read496_b5.py: the Fable read of the Sonnet drafts for Matthew 25–28 (batch b5, the last Matthew batch). Applies the corrections below to
out/matthew_<N>_draft.json and writes out/matthew_<N>_fixed.json (the drafts stay as drafted). Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, re, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *
E = {
 25: {},
 26: {
  # "Daniel keeps the word *like*" / "that is all Daniel's own page gives" — the brief's instructions to the drafter leaking into the reader's prose
  4147: dict(prose="Led before Caiaphas, he answers with Daniel's vision: one *like the Son of Adam* who came *with the clouds of heaven* to the Ancient of days. Daniel's word is *like*, for the one who comes took on flesh and looked like a son of Adam, and the next verse says what is given him, *dominion, and glory, and a kingdom* (Daniel 7:14). The man standing bound before the high priest is saying that figure is himself."),
  # a verse number cited in passing in the prose
  4138: dict(prose="Genesis gives the measure of the sword: blood shed by man is answered by man. When a disciple draws his sword in the garden Yahusha (Jesus) says *all they that take the sword shall perish with the sword* (Matthew 26:52), and tells him to put it up. He refuses the sword to save himself."),
 },
 27: {
  # "so this is a reading line on line, but" — the drafter talking about his own reading instead of giving it
  4180: dict(prose="The first promise in Genesis sets the serpent's seed against the woman's seed: *it shall bruise thy head, and thou shalt bruise his heel*. Matthew does not quote it; read line on line with the hall, the enmity is out in the open there, and the verse says whose head is bruised in the end."),
 },
 28: {
  # "Nothing here fixes a date beyond what the two verses say" — the brief's rule, not something the reader needs told
  4201: dict(prose="Leviticus starts the counting *from the morrow after the sabbath*, the day after the sheaf of the wave offering is brought, and Matthew sets the women at the sepulchre as one sabbath ends and the first day of the week dawns. That puts the empty tomb on a morning after a sabbath, the morning the firstfruits count begins."),
 },
}
tot = 0
for ch in range(25, 29):
    d = json.load(open(W6 / 'out' / f'matthew_{ch}_draft.json')); n = 0
    for c in d['cards']:
        for k, v in (E.get(ch, {}).get(c['id']) or {}).items(): c[k] = v; n += 1
        c['prose'] = re.sub(r"\s*\n+\s*", " ", c['prose']).strip()
    assert set(E.get(ch, {})) <= {c['id'] for c in d['cards']}
    for t in d.get('new_threads') or []:
        assert "*It ain't new" not in t['summary_md'] and 'This is not new' not in t['summary_md'], t['slug']
    d['read'] = f"Read on Claude Fable 5.1 (claude-fable-5-1), 2026-11-13: every card read against both verses and the voice standard; {n} correction(s) applied in read496_b5.py; drafted on {d['model']}."
    json.dump(d, open(W6 / 'out' / f'matthew_{ch}_fixed.json', 'w'), ensure_ascii=False, indent=1)
    print(ch, 'cards', len(d['cards']), 'corrections', n); tot += n
print('total', tot)
