"""S496 — read496.py: the Fable read of the Sonnet drafts for Matthew 8–13 (batch b2). Applies the corrections below to out/matthew_<N>_draft.json and
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
 8: {
  3364: dict(prose="The cry *before the time* asks about a time already set. Peter says Elohim (God) did not spare the angels that sinned but delivered them into chains *to be reserved unto judgment*, and the spirits in the tombs of the Gergesenes know that same day is waiting for them."),
 },
 9: {
 },
 10: {
  2738: dict(prose="The men he calls here are sent to *the lost sheep of the house of Yashar'el (Israel)* (Matthew 10:6), and the city at the end is built around those same tribes, with a name on each of the twelve gates. What the twelve go out to gather is what the gates are named for."),
 },
 11: {
  2748: dict(prose="The ones who *labour and are heavy laden* are not bent under the Father's commandments. The load Yahusha (Jesus) names elsewhere is the one the scribes and Pharisees lay on, where they *bind heavy burdens and grievous to be borne* and set them on men's shoulders, and will not lift a finger to move them. The people under that load are the ones he calls to himself."),
  3445: dict(member_sentence="Sodom and Gomorrah were destroyed by brimstone and fire, and Yahusha (Jesus) says Capernaum stands worse than they did."),
 },
 12: {
  2780: dict(prose="Luke sets the saying among confessing and denying him before men, so it sits with the question of who stands with him and who stands against. A *word against the Son of Adam* is forgiven again, and the one who *blasphemeth against the Ruach HaKodesh (Holy Spirit)* is not, which tells us the line runs at the Spirit's work and not at a man's slowness to see who he is."),
  2791: dict(prose="*Whosoever shall do the will of my Father* is the same test he set at the end of the Sermon, where saying *Adonai (Lord), Adonai (Lord)* gets no one in and *he that doeth the will of my Father* does. His brother, sister and mother are known by what is done with the Father's will, and not by what a man calls him."),
  2793: dict(prose="The family he points to in the field gets the same shape in John. A brother, sister or mother is the one who does the Father's will, and a friend is the one who does *whatsoever I command you*. Closeness to him is measured by doing what he says, not by standing outside and calling for him."),
 },
 13: {
  2824: dict(prose="A woman hides leaven in three measures of meal until the whole is leavened. The Torah says what leaven is: at the feast ye *put away leaven out of your houses*, and whoever eats it in those days is cut off from Yashar'el (Israel). So the woman's leaven is something that gets into the meal and has to be put out, not something welcomed."),
  2826: dict(prose="When he speaks of leaven again it is a warning: *beware of the leaven of the Pharisees and of the Sadducees*. Leaven in his own mouth is something to watch for, and the woman and her three measures are heard the same way, a small thing working its way through the whole meal."),
  2831: dict(prose="Three measures of fine meal is what Abraham told Sarah to make ready the day Yahuah (the LORD) came to his tent with two others and he hurried to feed them. The woman in the parable hides her leaven in that same quantity. It is the meal of a covenant house, the meal set before Yahuah (the LORD) himself, that the leaven is put into.",
             member_sentence="Abraham has Sarah make ready three measures of fine meal the day Yahuah (the LORD) came to his tent, the quantity the woman's leaven is hid in."),
 },
}
T = {
 10: {'matthew-10-the-twelve-called-and-the-twelve-tribes': dict(replace=("Twelve men for twelve tribes. That is why the first errand is not to the whole earth but to the house the tribes came from.", "Twelve men for twelve tribes. That is why the errand is to the lost sheep of those same tribes, wherever they have been scattered."))},
}
for ch in range(8, 14):
    d = json.load(open(W6 / 'out' / f'matthew_{ch}_draft.json')); n = 0
    for c in d['cards']:
        for k, v in (E.get(ch, {}).get(c['id']) or {}).items(): c[k] = fill(v); n += 1
        c['prose'] = re.sub(r"\s*\n+\s*", " ", c['prose']).strip()          # a card note is one paragraph
    assert set(E.get(ch, {})) <= {c['id'] for c in d['cards']}
    for t in d.get('new_threads') or []:
        fx = T.get(ch, {}).get(t['slug']) or {}
        if 'tail_from' in fx:
            i = t['summary_md'].index(fx['tail_from']); t['summary_md'] = t['summary_md'][:i] + fx['tail']; n += 1
        if 'replace' in fx:
            a, b = fx['replace']; assert a in t['summary_md']; t['summary_md'] = t['summary_md'].replace(a, b); n += 1
    d['read'] = f"Read on Claude Fable 5.1 (claude-fable-5-1), 2026-11-10: every card read against both verses and the voice standard; {n} correction(s) applied in read496.py; drafted on {d['model']}."
    json.dump(d, open(W6 / 'out' / f'matthew_{ch}_fixed.json', 'w'), ensure_ascii=False, indent=1)
    print(ch, 'cards', len(d['cards']), 'corrections', n)
