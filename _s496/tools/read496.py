"""S496 — read496.py: the Fable read of the Sonnet drafts for Matthew 1–7. Applies the corrections below to out/matthew_<N>_draft.json and
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
 1: {
  2598: dict(prose="The psalm tells the singers to praise him *by his name JAH*, the short form of the name. That same Yah is the first part of Yahusha (Jesus), so the name the angel gives carries Yah in it and says what he has come to do.",
             member_sentence="The psalm calls the singers to praise him by his name Yah, which is the first part of the name Yahusha (Jesus)."),
  3240: dict(prose="Joseph knew what the Torah says where *a damsel that is a virgin be betrothed* and is found with another man. Being a just man he was not willing to make her a public example, and the Torah itself gave him the quiet road he chose."),
  3243: dict(prose="The first Joseph was a dreamer, and *Joseph dreamed a dream* that steered the course of his father's whole house. This Joseph is given word in a dream too, and before the story is far along he also goes down into Egypt with the seed of promise in his keeping."),
  3239: dict(prose="Matthew tells the conception from Joseph's side and Luke tells it from Mary's, beginning where *the angel Gabriel was sent from Elohim (God)* to Nazareth. It is one event told from two doorways, and the two accounts agree on whose child this is."),
 },
 2: {
  2609: dict(prose="This is how the word of Yahuah (the LORD) against Mount Seir, Esau's mountain, opens, and a few verses on it gives the charge: *{ezekiel 35:5}* (Ezekiel 35:5) Herod troubled in Jerusalem sits under that same word.",
             member_sentence="The word of Yahuah (the LORD) comes to Ezekiel against Mount Seir, and it answers Edom's lasting hatred of the children of Yashar'el (Israel)."),
  2611: dict(prose="Esau's hatred of Jacob went as far as murder in his heart because of the blessing. Herod's order to kill the children of Bethlehem is that same hatred, reaching for the line the blessing ran through."),
  2614: dict(member_sentence="A man of the house of Levi takes a daughter of Levi to wife, the house into which Moses is born and hidden from the king."),
  2623: dict(prose="At the table Yahusha (Jesus) speaks of his blood *of the new testament*, and that is the covenant Rachel's chapter promised to both houses. The weeping at Bethlehem opens toward it, because *the remission of sins* is the door by which the children carried away are brought home."),
  3253: dict(prose="The elders at the gate asked Yahuah (the LORD) to make Ruth like Rachel and like Leah, who built the house of Yashar'el (Israel), and to let Boaz *be famous in Beth-lehem*. Ruth came into the line as the wife of a son of Yahudah (Judah), and from that marriage came David, and from David the King the scribes are asked about."),
 },
 3: {
  2638: dict(prose="The men who came down from Judaea made a mark in the flesh the door of salvation, saying that without it *ye cannot be saved*. That is the same shelter John tears away when he tells the Pharisees not to say they have Abraham for their father. John asks for fruit, and these men pointed to a credential."),
  2641: dict(member_sentence="Nicodemus, a Pharisee and a ruler, comes to Yahusha (Jesus) himself, so a man standing inside that system can still turn and come."),
 },
 4: {
  2646: dict(prose="Look at what the devil left off when he quoted this at the pinnacle. The promise is that the angels keep him *in all thy ways*, and a leap from the temple roof is nobody's way. It is a dare. Yahusha (Jesus) walks in the ways of Yahuah (the LORD), and he will not put the Father to the proof."),
  2655: dict(prose="The devil offers the kingdoms at once, for one act of worship. Daniel sees them given another way, to the one like the Son of Adam brought near the Ancient of days: *And there was given him dominion, and glory, and a kingdom* (Daniel 7:14). That is the Father's gift in the Father's time, and Yahusha (Jesus) waits for it and will not take it from one who has no right to give it."),
  3272: dict(prose="Isaiah tells the fearful hearts to be strong, because their Elohim (God) is coming to save them, and the next verse says what that coming looks like: *{isaiah 35:5}* (Isaiah 35:5) That is the work going on all through Galilee, and it is the sign Yahusha (Jesus) later points John to."),
 },
 5: {
  3279: dict(prose="The righteousness the hungry are filled with has a person behind it, the righteous Branch raised up to David, and the next verse gives his name: *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6). Yahusha (Jesus) is that Branch, speaking on the mountain to the ones who hunger."),
  3284: dict(member_sentence="Luke records the same saying, that heaven and earth will pass sooner than one tittle of the law fails."),
 },
 6: {
  2688: dict(member_sentence="Forgiveness comes to the one who confesses his sins, so it is not received apart from a turned heart."),
 },
 7: {
  3338: dict(member_sentence="Zephaniah says Yahuah (the LORD) will leave an afflicted and poor people, and what marks them is that they trust in his name."),
  3344: dict(prose="David calls on his rock with the flood already around him, and he says what it holds up under: *the floods of ungodly men made me afraid* (Psalm 18:4). The house that does not fall stands on the one he calls his rock, his fortress and his deliverer, Yahuah (the LORD) himself."),
  3345: dict(prose="James puts the two builders into one line. Hearing alone deceives a man, and the doer is the one who holds to *the perfect law of liberty* (James 1:25), the commandment the whole sermon rests on. The house on the rock is the word heard and done, and the house on the sand is the word heard and left there."),
 },
}
T = {
 1: {'matthew-1-carried-away-to-babylon': {}},
 2: {'matthew-2-herod-and-the-old-hatred-of-esau': dict(tail_from="The cards here set Herod", tail="Herod was of Edom's house, an Idumean set on the throne in Jerusalem, and the prophets had already spoken to that house: Moses' message to the king of Edom at the border, the word given to Ezekiel against Mount Seir, the psalm that remembers the day the city fell. What Matthew shows in Herod is the old hatred of the blessing, sitting on a throne. It is the throne and the hatred the scripture names, and the word that stands over both is the one Malachi wrote down: *yet I loved Jacob*.")},
 3: {'matthew-3-the-jordan-joshua-elijah-naaman': dict(replace=("It ain't new: the river itself was already carrying this. Matthew simply sets", "It ain't new. The river was already carrying this, and Matthew sets"))},
}
for ch in range(1, 8):
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
    d['read'] = f"Read on Claude Fable 5.1 (claude-fable-5-1), 2026-11-09: every card read against both verses and the voice standard; {n} correction(s) applied in read496.py; drafted on {d['model']}."
    json.dump(d, open(W6 / 'out' / f'matthew_{ch}_fixed.json', 'w'), ensure_ascii=False, indent=1)
    print(ch, 'cards', len(d['cards']), 'corrections', n)
